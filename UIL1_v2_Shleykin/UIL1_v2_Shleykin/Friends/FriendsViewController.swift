//
//  FriendsViewController.swift
//  UIL1_v2_Shleykin
//
//  Created by Ivan Shleykin on 06/03/2019.
//  Copyright © 2019 Ivan Shleykin. All rights reserved.
//

import UIKit

class FriendsViewController: UITableViewController , UISearchBarDelegate, UISearchResultsUpdating {

    
    
    let searchControllerFriend = UISearchController(searchResultsController: nil)
    var searchFriend: [Friend] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "FriendsHeader", bundle: Bundle.main ), forHeaderFooterViewReuseIdentifier: "FriendsHeader")

        searchControllerFriend.searchResultsUpdater = self
        searchControllerFriend.searchBar.delegate = self
        tableView.tableHeaderView = searchControllerFriend.searchBar
        searchFriend = friends
        tableView.reloadData()
        print(firstChars)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return firstChars.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sortedFriends = []
        for friend in searchFriend {
            if String(friend.name.prefix(1)) == firstChars[section] {
                sortedFriends.append(friend)
            }
        }
        print(sortedFriends)
        return sortedFriends.count

    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendsViewCell

        
        
        let friend = searchFriend[indexPath.row]
        cell.friendName.text = friend.name
        cell.friendImage.image = friend.image

        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "UserPhotosSegue"){
            let destinationController = segue.destination as! AvatarViewController
            if let indexPath = tableView.indexPathForSelectedRow {
                destinationController.friend = searchFriend[indexPath.row]
            }
        }
        
    }
    
//MARK: - SearchBarDelegate
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if let searchText = searchBar.text {
            if searchText.isEmpty {
                searchFriend = friends
            }else {
                searchFriend = [];
                for friend in friends {
                    if friend.name.range(of: searchText) != nil {
                        searchFriend.append(friend)
                    }
                }
            }
        }
        tableView.reloadData()
    }

    
    func updateSearchResults(for searchController: UISearchController) {
        tableView.reloadData()
    }
    
    
    
// МАRK: - Header
    
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let header = tableView.dequeueReusableCell(withIdentifier: "FriendsHeader")
//        header?.backgroundView = UIView()
//        header?.backgroundView?.backgroundColor = .green
//        return header
//    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return firstChars[section]
    }

}
