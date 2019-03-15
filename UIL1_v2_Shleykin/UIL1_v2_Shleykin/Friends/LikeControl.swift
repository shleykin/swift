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
var likeCountLabel = UILabel()
var likeCount: Int = 0

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
        likeCountLabel.translatesAutoresizingMaskIntoConstraints = false
        likeCountLabel.heightAnchor.constraint(equalToConstant: kLikeSize).isActive = true
        likeCountLabel.widthAnchor.constraint(equalToConstant: kLikeSize).isActive = true
        likeCountLabel.font = UIFont.systemFont(ofSize: 25)
        likeCountLabel.text = "\(likeCount)"
        
        addSubview(likeCountLabel)
        
    }
    
   
    @objc func likeButtonTapped () {
        print("LikeButton Tapped")
        
        button.isSelected = !button.isSelected
        likeCount = button.isSelected ? (likeCount + 1) : (likeCount - 1)
        likeCountLabel.textColor = button.isSelected ? (.red ) : (.black)
        
        print("\(button.isSelected)")
        print("\(likeCount)")
        setUpButton()
    }

}
