//
//  EchoMessage.swift
//  TestMercury
//
//  Created by Jeffrey Varner on 4/5/16.
//  Copyright © 2016 Varnerlab. All rights reserved.
//

import Foundation
import Mercury

class EchoMessage:MercuryMessage {
    
    // Class/instance variables -
    var message_payload:String?
    
    func getMercuryMessageKey() -> MessageKey {
        return Mercury.EchoKey
    }
    
    
    
}