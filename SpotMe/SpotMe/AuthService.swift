//
//  AuthService.swift
//  SpotMe
//
//  Created by Peter Kang on 10/19/16.
//  Copyright © 2016 Peter Kang. All rights reserved.
//

/*
 
 import Foundation
import FirebaseAuth


typealias Completion = (_ errMsg: String?, _ data: AnyObject?) -> Void




class AuthService {
    
    private static let _instance = AuthService()
    
    
    static var instance: AuthService {
    
        return _instance
    }
    
    
    
    func handleFirebaseError(error: NSError, onComplete: Completion?) {
    
        print(error.debugDescription)
        if let errorCode = FIRAuthErrorCode(rawValue: error.code){
        
            switch (errorCode) {
            case .errorCodeInvalidEmail:
                onComplete?("Invalid email address", nil)
                //print
            case .errorCodeWrongPassword:
                onComplete?("Invalid password", nil)
            case .errorCodeEmailAlreadyInUse:
                onComplete?("Could not create account. Email already in use", nil)
            default:
                onComplete?("There was a problem authenticating. Try again.", nil)
            
            }
        }
    
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}
 */
