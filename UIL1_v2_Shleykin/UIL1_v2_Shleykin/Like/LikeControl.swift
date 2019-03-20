//
//  LikeControl.swift
//  UIL1_v2_Shleykin
//
//  Created by Ivan Shleykin on 14/03/2019.
//  Copyright © 2019 Ivan Shleykin. All rights reserved.
//

import UIKit



class LikeControl: UIControl {
    
    
    let button = UIButton()
    var likeCountLabel = UILabel()
    let kLikeSize: CGFloat = 40
    var likeCount: Int = 0
    
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
        button.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        
        likeCountLabel.translatesAutoresizingMaskIntoConstraints = false
        likeCountLabel.font = UIFont.systemFont(ofSize: kLikeSize * 0.5)
        likeCountLabel.text = "\(likeCount)"

        addSubview(button)
        addSubview(likeCountLabel)
        
        
    }
    
   
    @objc func likeButtonTapped () {
        button.isSelected = !button.isSelected
        likeCount = button.isSelected ? (likeCount + 1) : (likeCount - 1)
        likeCountLabel.textColor = button.isSelected ? .red  : .black
        
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.6
        pulse.fromValue = 0.95
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = 2
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        layer.add(pulse, forKey: nil)
        
        setUpButton()
        
        //print("LikeButton Tapped")
        //print("\(button.isSelected)")
        //print("\(likeCount)")
        
    }

    
    
}
