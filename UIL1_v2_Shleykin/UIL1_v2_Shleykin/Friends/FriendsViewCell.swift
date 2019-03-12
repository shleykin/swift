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
        
        //friendImage.layer.cornerRadius = friendImage.frame.height / 2
        //friendImage.clipsToBounds = true
        //friendImage.layer.shadowRadius = 4.0
        //friendImage.layer.shadowOpacity = 1
        //friendImage.layer.shadowOffset = CGSize.zero
        //friendImage.layer.shadowPath = UIBezierPath(roundedRect: friendImage.bounds , cornerRadius: friendImage.frame.height / 2 ).cgPath
        //friendImage.layer.shouldRasterize = true
        
        let imageCotainer = UIView(frame: CGRect(x: 0, y: 0, width: friendImage.frame.width, height: friendImage.frame.height))
        imageCotainer.clipsToBounds = false
        imageCotainer.layer.shadowColor = UIColor.black.cgColor
        imageCotainer.layer.shadowOpacity = 0.2
        imageCotainer.layer.shadowOffset = CGSize(width: 0, height: 1)
        imageCotainer.layer.shadowRadius = 2
        
        
        var imageView1 = UIImageView(frame: imageCotainer.bounds)
        imageView1 = friendImage
        imageView1.clipsToBounds = true
        let cornerRadius = imageView1.frame.height / 2
        imageView1.layer.cornerRadius = cornerRadius
        
        imageCotainer.layer.shadowPath = UIBezierPath(roundedRect: imageCotainer.bounds, cornerRadius: cornerRadius).cgPath
        // Add image into container
        imageCotainer.addSubview(imageView1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
/*let imageSize: CGFloat = 64.0

// Create a container which has a shadow
let imageCotainer = UIView(frame: CGRect(x: 0, y: 0, width: imageSize, height: imageSize))
imageCotainer.clipsToBounds = false
imageCotainer.layer.shadowColor = UIColor.black.cgColor
imageCotainer.layer.shadowOpacity = 0.2
imageCotainer.layer.shadowOffset = CGSize(width: 0, height: 1)
imageCotainer.layer.shadowRadius = 2

// Create an image view that will be inserted into the container view
let imageView = UIImageView(frame: imageCotainer.bounds)
imageView.image = yourImage
imageView.clipsToBounds = true
let cornerRadius = imageView.frame.height / 2
imageView.layer.cornerRadius = cornerRadius

// Draw a shadow
imageCotainer.layer.shadowPath = UIBezierPath(roundedRect: imageCotainer.bounds, cornerRadius: cornerRadius).cgPath
// Add image into container
imageCotainer.addSubview(imageView)
*/
