//
//  User.swift
//  SpotMe
//
//  Created by Peter Kang on 10/19/16.
//  Copyright © 2016 Peter Kang. All rights reserved.
//

import Foundation



struct User {


    private var _firstName: String
    private var _lastName: String
    private var _uid: String
    private var _image: String
    private var _currentLocation: [Double]
    
    
    var uid: String {
        return _uid
    }
    
    var fullName: String {
        return "\(_firstName)\(_lastName)"
    }
    
    var image: String {
        return _image
    }
    
    var currentLocation: [Double]{
        return _currentLocation
    }
    
    
    init(uid: String, firstName: String, lastName: String, image: String, currentLocation: [Double]){
        _uid = uid
        _firstName = firstName
        _lastName = lastName
        _image = image
        _currentLocation = currentLocation
    }


}
