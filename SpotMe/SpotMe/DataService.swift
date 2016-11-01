//
//  DataService.swift
//  SpotMe
//
//  Created by Peter Kang on 10/19/16.
//  Copyright © 2016 Peter Kang. All rights reserved.
//

import Foundation
import FirebaseDatabase
import Firebase


let DB_BASE = FIRDatabase.database().reference()


class DataService {

    private static let _instance = DataService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_EVENTS = DB_BASE.child("events")
    private var _REF_USERS = DB_BASE.child("users")
    private var _REF_CONVOS = DB_BASE.child("convos")
    
    
    
    
    
    static var instance: DataService {
        return _instance
    }
    
    
    var usersRef: FIRDatabaseReference {
        return _REF_USERS
    }
    
    var eventsRef: FIRDatabaseReference {
        return _REF_EVENTS
    }
    
    var convosRef: FIRDatabaseReference {
        return _REF_CONVOS
    }
    
    func saveUser(uid: String, displayName: String, gender: String, email: String) {
        let profile: Dictionary<String, AnyObject> = ["displayName": displayName as AnyObject, "gender": gender as AnyObject, "email": email as AnyObject]
        usersRef.child(uid).child("profile").setValue(profile)
    }
    
    func saveEvent(uid: String, title: String, duration: Double, location: [Double], details: String, image: String, creator: String ) {
        let event: Dictionary<String, AnyObject> = ["title": title as AnyObject, "location": location as AnyObject, "details": details as AnyObject, "image": image as AnyObject, "duration": duration as AnyObject, "creator": "" as AnyObject]
        eventsRef.child(uid).child("profile").setValue(event)
    }
    
    func saveConvo(cid: String) {
        let profile: Dictionary<String, AnyObject> = ["user1": "" as AnyObject, "user2": "" as AnyObject, "details": "" as AnyObject, "image": "" as AnyObject, "duration": "" as AnyObject]
        convosRef.child(cid).child("profile").setValue(profile)
    }
    
    

}
