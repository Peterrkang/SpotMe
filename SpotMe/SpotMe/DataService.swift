//
//  DataService.swift
//  SpotMe
//
//  Created by Peter Kang on 10/19/16.
//  Copyright © 2016 Peter Kang. All rights reserved.
//

import Foundation
import FirebaseDatabase


class DataService {

    private static let _instance = DataService()
    
    static var instance: DataService {
        return _instance
    }
    
    
    var mainRef: FIRDatabaseReference {
        return FIRDatabase.database().reference()
    }
    
    var usersRef: FIRDatabaseReference {
        return mainRef.child("users")
    }
    
    var eventsRef: FIRDatabaseReference {
        return mainRef.child("events")
    }
    
    var convosRef: FIRDatabaseReference {
        return mainRef.child("convos")
    }
    
    func saveUser(uid: String, displayName: String, gender: String, email: String) {
        let profile: Dictionary<String, AnyObject> = ["displayName": displayName as AnyObject, "gender": gender as AnyObject, "email": email as AnyObject]
        mainRef.child("users").child(uid).child("profile").setValue(profile)
    }
    
    func saveEvent(uid: String, title: String, duration: Double, location: [Double], details: String, image: String, creator: String ) {
        let event: Dictionary<String, AnyObject> = ["title": title as AnyObject, "location": location as AnyObject, "details": details as AnyObject, "image": image as AnyObject, "duration": duration as AnyObject, "creator": "" as AnyObject]
        mainRef.child("events").child(uid).child("profile").setValue(event)
    }
    
    func saveConvo(cid: String) {
        let profile: Dictionary<String, AnyObject> = ["user1": "" as AnyObject, "user2": "" as AnyObject, "details": "" as AnyObject, "image": "" as AnyObject, "duration": "" as AnyObject]
        mainRef.child("events").child(cid).child("profile").setValue(profile)
    }
    
    

}
