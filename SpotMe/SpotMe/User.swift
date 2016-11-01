//
//  User.swift
//  SpotMe
//
//  Created by Peter Kang on 10/19/16.
//  Copyright © 2016 Peter Kang. All rights reserved.
//

import Foundation



class User {


    private var _firstName: String
    private var _lastName: String
    private var _uid: String
    private var _image: String
    private var _currentLocation: [Double]
    private var _gender: String
    
    
    var uid: String {
        return _uid
    }
    
    var gender: String {
    
        return _gender
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
    
    
    init(uid: String, firstName: String, lastName: String, image: String, currentLocation: [Double], gender: String){
        _uid = uid
        _firstName = firstName
        _lastName = lastName
        _image = image
        _gender = gender
        _currentLocation = currentLocation
    }
    
    
    func updateLocation(location: Double){
    
        self._currentLocation = [location]
    
    }


}
