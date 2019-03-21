//
//  AvatarViewController.swift
//  UIL1_v2_Shleykin
//
//  Created by Ivan Shleykin on 11/03/2019.
//  Copyright © 2019 Ivan Shleykin. All rights reserved.
//

import UIKit

class AvatarViewController: UIViewController {
    
   // let likeControl = LikeControl(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    var friend: Friend? {
        didSet {
            if(friend != nil){
                navigationItem.title = friend?.name
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
           // view.addSubview(likeControl)
        
    }
    
    
}

extension AvatarViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: AvatarCollectionViewCell.self), for: indexPath) as! AvatarCollectionViewCell
        cell.imageView.image = friend?.image
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    

    
    
    
}




