//
//  ChatCell.swift
//  Chat
//
//  Created by Denny Ho on 10/3/18.
//  Copyright © 2018 Denny Ho. All rights reserved.
//

import UIKit
import Parse


class ChatCell: UITableViewCell {

    @IBOutlet weak var messageField: UILabel!
    
    @IBOutlet weak var usernameField: UILabel!
    
    var messages: PFObject! {
        didSet{
            self.messageField.text = messages.object(forKey:"text") as? String
            let user = messages.object(forKey:"user") as? PFUser
            let userName = user?.username
            self.usernameField.text = userName
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
