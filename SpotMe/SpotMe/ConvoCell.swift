//
//  ConvoCell.swift
//  SpotMe
//
//  Created by Peter Kang on 10/19/16.
//  Copyright © 2016 Peter Kang. All rights reserved.
//

import UIKit

class ConvoCell: UITableViewCell {

    
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var lastMessageLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateUI(convo: Convo) {
        fullNameLabel.text = "\(convo.eventId)"
    }

}
