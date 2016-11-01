//
//  ChatVC.swift
//  SpotMe
//
//  Created by Peter Kang on 10/19/16.
//  Copyright © 2016 Peter Kang. All rights reserved.
//

import UIKit
import Firebase



private let reuseIdentifier = "Cell"

class ChatVC: UICollectionViewController {
    
    
    private var _chat: Chat!
    
    
    var chat: Chat {
    
        get {
            return _chat
        
        } set {
            _chat = newValue
        }
    
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()


        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }



    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // Configure the cell
    
        return cell
    }


}
