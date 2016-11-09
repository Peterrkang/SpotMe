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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
    /*
     Distance/keywords
     
     func observeEvent(){
        DataService.instance.eventsRef.observeSingleEvent(of: .value) { (snapshot: FIRDataSnapshot) in
            if let events = snapshot.value as? Dictionary<String, AnyObject>{
                for(key, value) in events{
                    if(value["userId"] as? String == self._userID){
                        if let title = value["title"] as? String {
                            let event = Event(id: key, userId: self._userID!, title: title)
                            self.events.append(event)
                            
                        }
                    }
                }
            }
            self.tableView.reloadData()
        }
    }*/
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell") as! EventCell
        let event = events[indexPath.row]
        cell.updateUI(event: event)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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

