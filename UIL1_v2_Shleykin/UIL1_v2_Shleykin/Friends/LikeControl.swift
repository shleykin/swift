//
//  LikeControl.swift
//  UIL1_v2_Shleykin
//
//  Created by Ivan Shleykin on 14/03/2019.
//  Copyright © 2019 Ivan Shleykin. All rights reserved.
//

import UIKit

class LikeControl: UIControl {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpButton()
    }
    
    required init?(coder : NSCoder) {
        super.init(coder: coder)
        setUpButton()
    }
    
    private func setUpButton () {
        let button = UIButton()
        button.backgroundColor = UIColor.blue
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        addSubview(button)
        
    }

}
