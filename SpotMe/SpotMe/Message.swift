//
//  Message.swift
//  SpotMe
//
//  Created by Peter Kang on 11/2/16.
//  Copyright © 2016 Peter Kang. All rights reserved.
//

import Foundation


class Message {

    private var _toUser: String
    private var _fromUser: String
    private var _timestamp: String
    private var _text: String
    
    var toUser: String {
        return _toUser
    }
    
    var fromUser: String {
        return _fromUser
    }
    
    
    var timestamp: String {
        return _timestamp
    }
    
    var text: String {
        return _text
    }
    
    
    init(toUser: String, fromUser: String, text: String, timestamp: String) {
        _toUser = toUser
        _fromUser = fromUser
        _text = text
        _timestamp = timestamp
    }






}
