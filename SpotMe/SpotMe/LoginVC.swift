//
//  ViewController.swift
//  SpotMe
//
//  Created by Peter Kang on 10/18/16.
//  Copyright © 2016 Peter Kang. All rights reserved.
//

import UIKit
import FirebaseAuth
import FBSDKLoginKit



class LoginVC: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func facebookBtnPressed(_ sender: AnyObject){
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email", "public_profile"], from: self) {(result, error) in
            if error != nil {
                print("Peter: Nope")
            }else if result?.isCancelled == true {
            
                print("Peter: User cancelled")
            
            }else {
                print("Peter: connected")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        
        }
    
    }

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    
    func firebaseAuth(_ credential: FIRAuthCredential){
        
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                
                print("Peter: Unable to authenticate wit firebase")
            }else {
                print("Peter: your in")
            }
        
        })
        
    
    }
    


    



}
