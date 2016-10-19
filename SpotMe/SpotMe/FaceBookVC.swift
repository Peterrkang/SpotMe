//
//  ViewController.swift
//  SpotMe
//
//  Created by Peter Kang on 10/18/16.
//  Copyright © 2016 Peter Kang. All rights reserved.
//

import UIKit
import FacebookLogin

class FaceBookVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginButton = LoginButton(readPermissions: [ .publicProfile ])
        loginButton.center = view.center
        
        view.addSubview(loginButton)
        
        
    }



}

