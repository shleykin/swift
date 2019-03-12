//
//  OtherGroupsViewCell.swift
//  UIL1_v2_Shleykin
//
//  Created by Ivan Shleykin on 11/03/2019.
//  Copyright © 2019 Ivan Shleykin. All rights reserved.
//

import UIKit

class OtherGroupsViewCell: UITableViewCell {

    @IBOutlet weak var otherGroupImage: UIImageView!
    @IBOutlet weak var otherGroupName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        otherGroupImage.layer.cornerRadius = otherGroupImage.frame.height / 2
        otherGroupImage.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
