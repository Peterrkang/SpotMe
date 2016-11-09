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
import SwiftKeychainWrapper


class LoginVC: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    /*override func viewDidAppear(_ animated: Bool) {
        if let _ = KeychainWrapper.standard.string(forKey: KEY_UID){
            
            performSegue(withIdentifier: "HomeVC", sender: nil)
            
        }
    }*/
    
    
    @IBAction func facebookBtnPressed(_ sender: AnyObject){
        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logIn(withReadPermissions: ["email", "public_profile", "user_photos"], from: self) {(result, error) in
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

    
    
    
    func firebaseAuth(_ credential: FIRAuthCredential){
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("Peter: Unable to authenticate wit firebase")
            }else {
                print("Peter: your in")
                if let user = user {
                    self.getFBUserData(uid: user.uid)
                    self.completeSignIn(uid: user.uid)
                }
            }
        })
    }
    
    
    func completeSignIn(uid: String){
        KeychainWrapper.standard.set(uid, forKey: KEY_UID)
        print("Peter: saved uid to keyChain")
        performSegue(withIdentifier: "HomeVC", sender: nil)
    }
    
    
    func getFBUserData(uid: String){
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "name, email, gender, picture"]).start(completionHandler: { (connection, result, error) -> Void in
                if error == nil {
                    let dict = result as! [String : AnyObject]
                    DataService.instance.saveUser(uid: uid, displayName: dict["name"] as! String, gender: dict["gender"] as! String, email: dict["email"] as! String)

                }
            })
        }
    }
    
    
    


}



    /*
 
 
     Code possibly used in the future
     func loginButtonWillLogin(_ loginButton: FBSDKLoginButton!) -> Bool {
        return true
    }
 
 
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        try! FIRAuth.auth()?.signOut()
        KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        print("User logged out of FB")
    }
    

    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailField.text, let pass = passwordField.text, (email.characters.count > 0 && pass.characters.count > 0){
            
            AuthService.instance.login(email: email, password: pass, onComplete: { (errMsg, data) in
                guard errMsg == nil else {
                    let alert = UIAlertController(title: "Error Authentication", message: errMsg, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    return
                
                }
                self.dismiss(animated: true, completion: nil)
            })           //call login service
        }else {
        
            let alert = UIAlertController(title: "Username and Password Required", message: "You must enter both a username and a password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        
    }
    */

