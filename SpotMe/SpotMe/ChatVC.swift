//
//  ChatVC.swift
//  SpotMe
//
//  Created by Peter Kang on 11/1/16.
//  Copyright © 2016 Peter Kang. All rights reserved.
//

import UIKit
import FirebaseDatabase
import SwiftKeychainWrapper


class ChatVC: UICollectionViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    private let _userID: String? = KeychainWrapper.standard.string(forKey: KEY_UID)
    private var _convo: Convo!
    private var messages = [Message]()
    
    var convo: Convo {
        get {
            return _convo
        } set {
            _convo = newValue
        }
    }
    
    var toUser: String {
        if _userID == convo.user1 {
            return convo.user2
        } else {
            return convo.user1
        }
        
    }
    
    var fromUser: String {
        if _userID == convo.user1 {
            return convo.user1
        } else {
            return convo.user2
        }
        
    }
    
    lazy var inputTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Message..."
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        return textField
    }()
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupComponents()
        
        tableView.delegate = self
        tableView.dataSource = self
        observeMessage()
        
    }
    
    func setupComponents(){
        
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        containerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        view.addSubview(tableView)
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true

        let sendButton = UIButton(type: .system)
        sendButton.setTitle("Send", for: .normal)
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(sendButton)
        sendButton.addTarget(self, action: #selector(handleSend), for: .touchUpInside)
        sendButton.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        sendButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        sendButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        sendButton.heightAnchor.constraint(equalTo: containerView.heightAnchor).isActive = true
        
        containerView.addSubview(inputTextField)
        
        inputTextField.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 8).isActive = true
        inputTextField.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        inputTextField.rightAnchor.constraint(equalTo: sendButton.leftAnchor).isActive = true
        inputTextField.heightAnchor.constraint(equalTo: containerView.heightAnchor).isActive = true
        
        let seperatorLineView = UIView()
        
        seperatorLineView.backgroundColor = UIColor.lightGray
        seperatorLineView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(seperatorLineView)
        
        seperatorLineView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        seperatorLineView.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        seperatorLineView.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        seperatorLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        seperatorLineView.bottomAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        
    }
    

    
    
    func handleSend(){
        let timestamp: String = "\(NSDate())"
        let ref = DataService.instance.convosRef.child(convo.id)
        let childRef = ref.childByAutoId()
        let values = ["text": inputTextField.text!, "toUser": toUser, "fromUser": fromUser, "timestamp": timestamp]
        childRef.updateChildValues(values)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        handleSend()
        textField.text = ""
        return true
    }

    func observeMessage() {
        let ref = DataService.instance.convosRef.child(convo.id)
        ref.observe(.childAdded, with: { (snapshot: FIRDataSnapshot) in
            if let dict = snapshot.value as? Dictionary<String, AnyObject>{
                if let text = dict["text"] as? String {
                    if let fromUser = dict["fromUser"] as? String {
                        if let timestamp = dict["timestamp"] as? String {
                            if let toUser = dict["toUser"] as? String {
                                let message = Message(toUser: toUser, fromUser: fromUser, text: text, timestamp: timestamp)
                                self.messages.append(message)
                                
                                
                                
                            }
                        }
                    }
                }
                
            }
            self.tableView.reloadData()
        }, withCancel: nil)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cellId")
        let message = messages[indexPath.row]
        cell.textLabel?.text = message.text
        return cell
        
    }
    
}
