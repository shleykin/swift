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

        UIView.animate(withDuration: 0.5,delay: 0,usingSpringWithDamping: 0.1,initialSpringVelocity: 0,options: [],animations: {
                        self.imageView.bounds.size.height -= 20
                        self.imageView.bounds.size.width -= 20
        }, completion: { _ in
                UIView.animate(withDuration: 0.5,delay: 0,usingSpringWithDamping: 0.1,initialSpringVelocity: 0,options: [],animations: {
                self.imageView.bounds.size.height += 20
                self.imageView.bounds.size.width += 20
                    
                })
        })
            
    }
        
    
//    UIView.animate(withDuration: 0.5, animations: {
//    self.label.frame.origin.y -= 100
//    }, completion: { _ in
//    UIView.animate(withDuration: 0.5, animations: {
//    self.label.alpha = 0.5
//    })
//    })
    
    //MARK:- Events
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super.touchesBegan(touches, with: event)
//        animate(isHighlighted: true)
//    }
//
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super.touchesEnded(touches, with: event)
//        animate(isHighlighted: false)
//    }
//
//    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super.touchesCancelled(touches, with: event)
//        animate(isHighlighted: false)
//    }
//
//    //MARK:- Private functions
//    private func animate(isHighlighted: Bool, completion: ((Bool) -> Void)?=nil) {
//        let animationOptions: UIView.AnimationOptions = [.allowUserInteraction]
//        if isHighlighted {
//            UIView.animate(withDuration: 0.5,
//                           delay: 0,
//                           usingSpringWithDamping: 1,
//                           initialSpringVelocity: 0,
//                           options: animationOptions, animations: {
//                            self.transform = .init(scaleX: 0.96, y: 0.96)
//            }, completion: completion)
//        } else {
//            UIView.animate(withDuration: 0.5,
//                           delay: 0,
//                           usingSpringWithDamping: 1,
//                           initialSpringVelocity: 0,
//                           options: animationOptions, animations: {
//                            self.transform = .identity
//            }, completion: completion)
//        }
//    }
    
    
}
//func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
//    UIView.animate(withDuration: 0.5) {
//        if let cell = collectionView.cellForItem(at: indexPath) as? AvatarCollectionViewCell {
//            cell.imageView.transform = .init(scaleX: 0.95, y: 0.95)
//            cell.contentView.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
//        }
//    }
//}
//
//func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
//    UIView.animate(withDuration: 0.5) {
//        if let cell = collectionView.cellForItem(at: indexPath) as? AvatarCollectionViewCell {
//            cell.imageView.transform = .identity
//            cell.contentView.backgroundColor = .clear
//        }
//    }
//}
