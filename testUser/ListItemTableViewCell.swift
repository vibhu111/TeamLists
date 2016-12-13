//
//  ListItemTableViewCell.swift
//  TeamLists
//
//  Created by Ramana Gandikota on 1/4/16.
//  Copyright © 2016 VG. All rights reserved.
//

import UIKit

class ListItemTableViewCell: UITableViewCell {

    
    
    @IBOutlet var desclabel: UILabel!
    @IBOutlet var itemLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        desclabel.text = ""
        itemLabel.text = ""
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

