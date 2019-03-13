//
//  IconAvatar.swift
//  UIL1_v2_Shleykin
//
//  Created by Ivan Shleykin on 13/03/2019.
//  Copyright © 2019 Ivan Shleykin. All rights reserved.
//

import UIKit

class IconAvatar: UIImageView {

    let imageSize: (height: CGFloat, width: CGFloat) = (43.0, 43.0)
    let cornerRadius: CGFloat = 21.5
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
