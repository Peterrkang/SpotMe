//
//  ConvoVC.swift
//  SpotMe
//
//  Created by Peter Kang on 10/19/16.
//  Copyright © 2016 Peter Kang. All rights reserved.
//



import UIKit
import FirebaseDatabase


class ConvoVC: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var tableView: UITableView!
    
    private var convos = [Convo]()
    
    private var event: Event
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        tableView.delegate = self
        tableView.dataSource = self


        DataService.instance.convosRef.observeSingleEvent(of: .value) { (snapshot: FIRDataSnapshot) in
            
            if let convos = snapshot.value as? Dictionary<String, AnyObject>{
                for (key, value) in convos {
                    if let value["eventId"] == event.id {
                    
                        if 
                        
                    
                    }
                }
            }
            self.tableView.reloadData()

        }
        
    }
    
    
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        self.event = sender as! Event
    }

    


    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConvoCell") as! ConvoCell
        let convo = convos[indexPath.row]
        cell.updateUI(convos: convo)
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
