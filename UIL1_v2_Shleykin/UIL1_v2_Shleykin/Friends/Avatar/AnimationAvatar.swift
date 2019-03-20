//
//  AnimationAvatar.swift
//  UIL1_v2_Shleykin
//
//  Created by Ivan Shleykin on 20/03/2019.
//  Copyright © 2019 Ivan Shleykin. All rights reserved.
//

import UIKit

extension AvatarCollectionViewCell {
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(onTap(recognizer:)))
        addGestureRecognizer(tap)
        
    }
    
    
    
    
    @objc func onTap(recognizer:UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0,
                       options: [],
                       animations: {
                        self.imageView.frame.origin.y -= 100
        })
        
    }
}
