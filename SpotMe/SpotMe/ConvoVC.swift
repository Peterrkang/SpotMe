//
//  ConvoVC.swift
//  SpotMe
//
//  Created by Peter Kang on 10/19/16.
//  Copyright © 2016 Peter Kang. All rights reserved.
//



import UIKit
import FirebaseDatabase
import SwiftKeychainWrapper


class ConvoVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var tableView: UITableView!
    
    private var convos = [Convo]()
    
    private var _event: Event!
    
    
    var event: Event {
        get {
            return _event
        } set {
            _event = newValue
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        observeConvo()
    }
    
    
    
    
    
    func observeConvo(){
        DataService.instance.convosRef.observeSingleEvent(of: .value) { (snapshot: FIRDataSnapshot) in
            
            if let convos = snapshot.value as? Dictionary<String, AnyObject>{
                for (key, value) in convos {
                    if let dict = value as? Dictionary<String, AnyObject>{
                        if dict["eventId"] as? String == self.event.id {
                            if let user2 = dict["user2"] as? String {
                                if let user1 = dict["user1"] as? String {
                                    let convo = Convo(id: key, user1: user1, user2: user2, eventId: self.event.id)
                                    self.convos.append(convo)
                                    
                                }
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
        let convo = convos[indexPath.row]
        cell.updateUI(convo: convo)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let convo = convos[indexPath.row]
        performSegue(withIdentifier: "ChatVC", sender: convo)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ChatVC" {
            if let destination = segue.destination as? ChatVC {
                if let convo = sender as? Convo {
                    destination.convo = convo
                }
            }
            
        }
    }
    
    
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return convos.count
    }
    
    
    
    
}
