//
//  ViewController.swift
//  TestMercury
//
//  Created by Jeffrey Varner on 4/5/16.
//  Copyright © 2016 Varnerlab. All rights reserved.
//

import UIKit
import Mercury

class ViewController: UIViewController,MercurySubscriber {
    
    // Class/instance variables -
    var mercury_instance:Mercury = Mercury.sharedInstance
    
    // IBOutlets -
    @IBOutlet var sent_message_label:UILabel?
    @IBOutlet var rcvd_message_label:UILabel?
    @IBOutlet var transmit_button:UIButton?
    
    // Test message -
    let test_message = String("Message to Mercury".characters.reverse())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // register myself for the echo message -
        mercury_instance.subscribe(self, messageKey: Mercury.EchoKey)
        
        // ok, put text into sent message label -
        if let _sent_message_label = sent_message_label {
            
            // text to send -
            _sent_message_label.text = "Send: "+test_message
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // Actions -
    @IBAction func transmitButtonWasPushedAction(sender:UIButton) -> Void {
        
        // Create a echo message -
        let echo_message = EchoMessage()
        echo_message.message_payload = test_message
        
        // ok, we registered for the echo = transmit a message on the echo channel -
        mercury_instance.publish(echo_message)
    }
    
    // Mercury methods -
    func receive(message: MercuryMessage) -> Void {
    
        // ok, we should get an echo message -
        if (message.getMercuryMessageKey() == Mercury.EchoKey){
            
            // reverse the message -
            if let _echo_message = message as? EchoMessage {
             
                if let _message_payload = _echo_message.message_payload, _rcvd_message_label = rcvd_message_label {
                    
                    _rcvd_message_label.text = "Rcvd: "+String(_message_payload.characters.reverse())
                }
            }
        }
    }
}

