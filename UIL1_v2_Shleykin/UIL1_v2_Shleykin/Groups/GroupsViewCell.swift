//
//  GroupsViewCell.swift
//  UIL1_v2_Shleykin
//
//  Created by Ivan Shleykin on 06/03/2019.
//  Copyright © 2019 Ivan Shleykin. All rights reserved.
//

import UIKit

class GroupsViewCell: UITableViewCell {

   
    @IBOutlet weak var groupName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
