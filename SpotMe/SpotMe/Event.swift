//
//  Event.swift
//  SpotMe
//
//  Created by Peter Kang on 10/19/16.
//  Copyright © 2016 Peter Kang. All rights reserved.
//

import Foundation


class Event {
    
    
    
    
    private var _id: String
    private var _title: String
    private var _userId: String
    
    
    var title: String {
        return _title
    }
    
    var userId: String {
        return _userId
    }
    
    var id: String {
        return _id
    }
    
    init(id: String, userId: String, title: String){
        _id = id
        _userId = userId
        _title = title
    }
    
    /*
    private var _location: [Double]
    private var _image: String
    private var _duration: Double
    private var _createdAt: String
    private var _creator: String
    private var _details: String
    

    var image: String {
        return _image
    }
    
    var createdAt: String {
        return _createdAt
    }
    
    var location: [Double]{
        return _location
    }

    
    var duration: Double {
        return _duration
    }
    
    var creator: String {
        return _creator
    }
    
    var details: String {
        return _details
    }
    
    
    init(title: String, creator: String, location: [Double], duration: Double, image: String, createdAt: String, details: String){
        _title = title
        _image = image
        _location = location
        _creator = creator
        _duration = duration
        _createdAt = createdAt
        _details = details
    }
    
    func distanceCheck(){
        
    
    }
 
 */
    
}
