//
//  shadowView.swift
//  UIL1_v2_Shleykin
//
//  Created by Ivan Shleykin on 13/03/2019.
//  Copyright © 2019 Ivan Shleykin. All rights reserved.
//

import UIKit

class shadowView: UIImageView {


    override func awakeFromNib() {
        layer.shadowRadius = 4.0
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize.zero
        layer.shadowPath = UIBezierPath(roundedRect: self.bounds , cornerRadius: self.frame.height / 2 ).cgPath
        layer.shouldRasterize = true
        self.clipsToBounds = true
    }
}
