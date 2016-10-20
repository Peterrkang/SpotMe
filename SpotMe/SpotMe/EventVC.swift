//
//  EventVC.swift
//  SpotMe
//
//  Created by Peter Kang on 10/19/16.
//  Copyright © 2016 Peter Kang. All rights reserved.
//

import UIKit
import FirebaseDatabase

class EventVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    private var events = [Event]()
    
    private var selectedUsers = Dictionary<String, User>()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsMultipleSelection = true
        
        DataService.instance.usersRef.observeSingleEvent(of: .value) { (snapshot: FIRDataSnapshot) in
            
            if let events = snapshot.value as? Dictionary<String, AnyObject>{
                for (key, value) in events {
                    if let dict = value as? Dictionary<String, AnyObject>{
                        if let profile = dict["profile"] as? Dictionary<String, AnyObject> {
                            if let title = profile["title"] as? String {
                                let eid = key
                                //let event = Event(eid: eid, title: title)
                                //self.events.append(event)
                            }
                        }
                    }
                }
            }
            self.tableView.reloadData()
            
        }
        
        
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConvoCell") as! ConvoCell
        //let user = users[indexPath.row]
        //cell.updateUI(user: user)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! ConvoCell
        //let user = users[indexPath.row]
        //selectedUsers[user.uid] = user
        
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

}

