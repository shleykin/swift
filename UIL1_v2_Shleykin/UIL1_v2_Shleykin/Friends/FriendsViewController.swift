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
    var filtredFriend: [Friend] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "FriendsHeader", bundle: Bundle.main ), forHeaderFooterViewReuseIdentifier: "FriendsHeader")

        searchControllerFriend.searchResultsUpdater = self
        searchControllerFriend.searchBar.delegate = self
        tableView.tableHeaderView = searchControllerFriend.searchBar
        filtredFriend = friends
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filtredFriend.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendsViewCell

        let friend = filtredFriend[indexPath.row]
        cell.friendName.text = friend.name
        cell.friendImage.image = friend.image

        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "UserPhotosSegue"){
            let destinationController = segue.destination as! AvatarViewController
            if let indexPath = tableView.indexPathForSelectedRow {
                destinationController.friend = friends[indexPath.row]
            }
        }
        
    }
    
//MARK: - SearchBarDelegate
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if let searchText = searchBar.text {
            if searchText.isEmpty {
                filtredFriend = friends
            }else {
                filtredFriend = [];
                for friend in friends {
                    if friend.name.range(of: searchText) != nil {
                        filtredFriend.append(friend)
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
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: "FriendsHeader")
        header?.backgroundView = UIView()
        header?.backgroundView?.backgroundColor = .green
        return header
    }
    
//    class GroupsViewController: UITableViewController, UISearchBarDelegate, UISearchResultsUpdating {
//
//        let searchController = UISearchController(searchResultsController: nil)
//        var filtredGroup: [Group] = []
//
//
//        override func viewDidLoad() {
//            super.viewDidLoad()
//
//            searchController.searchResultsUpdater = self
//            searchController.searchBar.delegate = self
//            tableView.tableHeaderView = searchController.searchBar
//            filtredGroup = groups
//            tableView.reloadData()
//
//
//        }
//
//        @IBAction func didSelectNewGroup(segue: UIStoryboardSegue) {
//            if segue.identifier == "AddGroup" {
//                let newgroup = segue.source as! OtherGroupsViewController
//
//                if let indexPath = newgroup.tableView.indexPathForSelectedRow {
//                    let group = otherGroups[indexPath.row]
//                    groups.append(group)
//                    otherGroups.remove(at: indexPath.row)
//                    tableView.reloadData()
//
//                }
//            }
//        }
//
//
//        override func numberOfSections(in tableView: UITableView) -> Int {
//            return 1
//        }
//
//        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//            return filtredGroup.count
//
//        }
//
//
//        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: GroupsViewCell.self), for: indexPath) as! GroupsViewCell
//
//            let group = filtredGroup[indexPath.row]
//            cell.groupName.text = group.name
//            cell.groupImage.image = group.image
//
//            return cell
//        }
//
//
//
//        override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//            if editingStyle == .delete {
//                let group = filtredGroup[indexPath.row]
//                otherGroups.append(group)
//                filtredGroup.remove(at: indexPath.row)
//                tableView.deleteRows(at: [indexPath], with: .fade)
//            }
//        }
//
//        // MARK: - SearchBarDelegate
//
//
//        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//            if let searchText = searchBar.text {
//                if searchText.isEmpty {
//                    filtredGroup = groups
//                }else {
//                    filtredGroup = [];
//                    for group in groups {
//                        if group.name.range(of: searchText) != nil {
//                            filtredGroup.append(group)
//                        }
//                    }
//                }
//            }
//            tableView.reloadData()
//        }
//
//        //
//        func updateSearchResults(for searchController: UISearchController) {
//            tableView.reloadData()
//        }
//
    
    
    

}
