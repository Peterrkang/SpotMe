//
//  Convo.swift
//  SpotMe
//
//  Created by Peter Kang on 10/19/16.
//  Copyright © 2016 Peter Kang. All rights reserved.
//

import Foundation


class Convo {

    private var _user1: String
    private var _user2: String
    private var _eventId: String
    private var _id: String
    
    var user1: String {
        return _user1
    }
    
    var user2: String {
        return _user2
    }

    
    var id: String {
        return _id
    }
    
    var eventId: String {
        return _eventId
    }
    
    
    init(id: String, user1: String, user2: String, eventId: String) {
        _id = id
        _user1 = user1
        _user2 = user2
        _eventId = eventId
    }




}
