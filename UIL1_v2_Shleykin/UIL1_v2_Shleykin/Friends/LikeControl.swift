//
//  LikeControl.swift
//  UIL1_v2_Shleykin
//
//  Created by Ivan Shleykin on 14/03/2019.
//  Copyright © 2019 Ivan Shleykin. All rights reserved.
//

import UIKit

let kLikeSize: CGFloat = 40
let button = UIButton()
var valueLabel: UILabel!
var value: Int = 0

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
        

        button.setImage(#imageLiteral(resourceName: "like"), for: .normal)
        button.setImage(#imageLiteral(resourceName: "liketapped"), for: .selected)
        
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: kLikeSize).isActive = true
        button.widthAnchor.constraint(equalToConstant: kLikeSize).isActive = true
        button.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        
        addSubview(button)
        
    }
    
   
    @objc func likeButtonTapped () {
        print("LikeButton Tapped")
        
        button.isSelected = !button.isSelected
        print("\(button.isSelected)")
    }

}
