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

       
        friendImage.layer.cornerRadius = friendImage.frame.height / 2
        friendImage.clipsToBounds = true

        
    }


}


