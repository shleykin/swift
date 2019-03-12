//
//  FriendsViewCell.swift
//  UIL1_v2_Shleykin
//
//  Created by Ivan Shleykin on 06/03/2019.
//  Copyright © 2019 Ivan Shleykin. All rights reserved.
//

import UIKit

class FriendsViewCell: UITableViewCell {


    @IBOutlet weak var friendImage: UIImageView!
    @IBOutlet weak var friendName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        friendImage.layer.cornerRadius = friendImage.frame.height / 2
       //friendImage.clipsToBounds = true
        friendImage.layer.shadowRadius = 4.0
        friendImage.layer.shadowOpacity = 1
        friendImage.layer.shadowOffset = CGSize.zero
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
