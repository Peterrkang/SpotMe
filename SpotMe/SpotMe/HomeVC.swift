//
//  HomeVC.swift
//  SpotMe
//
//  Created by Peter Kang on 10/18/16.
//  Copyright © 2016 Peter Kang. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import SwiftKeychainWrapper


class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    let userID: String? = KeychainWrapper.standard.string(forKey: KEY_UID)
    
    
    @IBOutlet weak var tableView: UITableView!
    
    private var events = [Event]()
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        DataService.instance.eventsRef.observeSingleEvent(of: .value) { (snapshot: FIRDataSnapshot) in
            
            if let events = snapshot.value as? Dictionary<String, AnyObject>{
                
                for(key, value) in events{
                    
                    
                    if(value["userId"] as? String == self.userID){
                        
                        if let title = value["title"] as? String {
                            
                            let event = Event(id: key, userId: self.userID!, title: title)
                            self.events.append(event)
                        
                        }
                        
                    }
                    
                }
                
        
            }
            self.tableView.reloadData()
            
        }

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //performSegue(withIdentifier: "LoginVC", sender: nil)
        guard FIRAuth.auth()?.currentUser != nil else{
            performSegue(withIdentifier: "LoginVC", sender: nil)
            return 
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell") as! EventCell
        let event = events[indexPath.row]
        cell.updateUI(event: event)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! EventCell
        let event = events[indexPath.row]
        
        performSegue(withIdentifier: "ConvoVC", sender: event)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ConvoVC" {
            if let destination = segue.destination as? ConvoVC {
                if let event = sender as? Event {
                    destination.event = event
                }
            }
            
        }
    }

    

    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }

    

}

    
   
