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
    
    func saveUser(uid: String) {
        let profile: Dictionary<String, AnyObject> = ["firstName": "" as AnyObject, "lastName": "" as AnyObject]
        mainRef.child("users").child(uid).child("profile").setValue(profile)
    }
    
    func saveEvent(eid: String) {
        let profile: Dictionary<String, AnyObject> = ["title": "" as AnyObject, "location": "" as AnyObject, "details": "" as AnyObject, "image": "" as AnyObject, "duration": "" as AnyObject, "creator": "" as AnyObject]
        mainRef.child("events").child(eid).child("profile").setValue(profile)
    }
    
    func saveConvo(cid: String) {
        let profile: Dictionary<String, AnyObject> = ["user1": "" as AnyObject, "user2": "" as AnyObject, "details": "" as AnyObject, "image": "" as AnyObject, "duration": "" as AnyObject]
        mainRef.child("events").child(cid).child("profile").setValue(profile)
    }
    
    

}
