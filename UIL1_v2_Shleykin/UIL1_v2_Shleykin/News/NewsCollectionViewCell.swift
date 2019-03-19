//
//  NewsCollectionViewCell.swift
//  UIL1_v2_Shleykin
//
//  Created by Ivan Shleykin on 18/03/2019.
//  Copyright © 2019 Ivan Shleykin. All rights reserved.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var autorImage: UIImageView!
    
    @IBOutlet weak var autorName: UILabel!
    @IBOutlet weak var dateOfPost: UILabel!
    @IBOutlet weak var bodyNews: UILabel!
    @IBOutlet weak var mainImageNews: UIImageView!
    @IBOutlet weak var heartImage: UIImageView!
    @IBOutlet weak var commentImage: UIImageView!
    @IBOutlet weak var shareImage: UIImageView!
    @IBOutlet weak var viewCountImage: UIImageView!
    @IBOutlet weak var viewCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
