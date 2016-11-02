//
//  MessageCell.swift
//  SpotMe
//
//  Created by Peter Kang on 11/2/16.
//  Copyright © 2016 Peter Kang. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateUI(message: Message){
        self.textLabel?.text = "\(message.text)"
    }

}
