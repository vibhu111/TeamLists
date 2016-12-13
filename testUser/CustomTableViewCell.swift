//
//  CustomTableViewCell.swift
//  testUser
//
//  Created by Ramana Gandikota on 5/4/15.
//  Copyright (c) 2015 VG. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    
    @IBOutlet var desclabel: UILabel!
    @IBOutlet var listname: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        desclabel.text = ""
        listname.text = ""
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
