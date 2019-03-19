//
//  SortedCharsFriends.swift
//  UIL1_v2_Shleykin
//
//  Created by Ivan Shleykin on 19/03/2019.
//  Copyright © 2019 Ivan Shleykin. All rights reserved.
//

import UIKit


var sortedFriends: [Friend] = []
var firstCharsNotFiltred: [String] = []
var firstChars: [String] = []


extension FriendsViewController {

    
    
    override func viewWillAppear(_ animated: Bool) {
        for friend in friends {
            if !firstCharsNotFiltred.contains(String(friend.name.prefix(1))) {
                firstCharsNotFiltred.append(String(friend.name.prefix(1)))
            }
        }
        print(firstCharsNotFiltred)
        firstChars = firstCharsNotFiltred.sorted()
        print(firstChars)
    }
    
}
