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
        /*
        friendImage.layer.shadowRadius = 4.0
        friendImage.layer.shadowOpacity = 1
        friendImage.layer.shadowOffset = CGSize.zero
        friendImage.layer.shadowPath = UIBezierPath(roundedRect: friendImage.bounds , cornerRadius: friendImage.frame.height / 2 ).cgPath
        friendImage.layer.shouldRasterize = true
        //friendImage.clipsToBounds = false
   
        let imageCotainer = UIView(frame: CGRect(x: 0, y: 0, width: friendImage.frame.width, height: friendImage.frame.height))
        imageCotainer.clipsToBounds = false
        imageCotainer.layer.shadowColor = UIColor.black.cgColor
        imageCotainer.layer.shadowOpacity = 1
        imageCotainer.layer.shadowOffset = CGSize(width: 0, height: 1)
        imageCotainer.layer.shadowRadius = 4
        
        
        var imageView1 = UIImageView(frame: imageCotainer.bounds)
        imageView1 = friendImage
        //imageView1.clipsToBounds = true
        let cornerRadius = imageView1.frame.height / 2
        imageView1.layer.cornerRadius = cornerRadius
        
        imageCotainer.layer.shadowPath = UIBezierPath(roundedRect: imageCotainer.bounds, cornerRadius: cornerRadius).cgPath
        // Add image into container
        //imageCotainer.addSubview(imageView1)
 
        
        */
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

/*
 class IconAvatar: UIImageView {
 
 let imageSize: (height: CGFloat, width: CGFloat) = (70.0, 70.0)
 let cornerRadius: CGFloat = 35.0
 @IBInspectable var shadow: Bool = true
 @IBInspectable var shadowCollor: UIColor = .black
 @IBInspectable var shadowOpacity: Float = 0.7
 @IBInspectable var shadowOffset: CGSize = CGSize(width: 5.0, height: 5.0)
 @IBInspectable var shadowRadius: CGFloat = 5.0
 
 func createIconAvatar(image name: String) {
 
 let imageContainer = UIView(frame: CGRect(x: 0, y: 0, width: imageSize.width, height: imageSize.height))
 
 
 if shadow {
 imageContainer.clipsToBounds = false
 imageContainer.layer.shadowColor = shadowCollor.cgColor
 imageContainer.layer.shadowOpacity = shadowOpacity
 imageContainer.layer.shadowOffset = shadowOffset
 imageContainer.layer.shadowRadius = shadowRadius
 imageContainer.layer.shadowPath = UIBezierPath(roundedRect: imageContainer.bounds, cornerRadius: cornerRadius).cgPath
 }
 
 let imageView = UIImageView(frame: imageContainer.bounds)
 
 imageView.clipsToBounds = true
 imageView.layer.cornerRadius = cornerRadius
 imageView.layer.borderColor = UIColor.black.cgColor
 imageView.layer.borderWidth = 1.0
 imageView.image = UIImage(named: name)
 
 self.addSubview(imageContainer)
 imageContainer.addSubview(imageView)
 
 }
 
 
 }
 */
