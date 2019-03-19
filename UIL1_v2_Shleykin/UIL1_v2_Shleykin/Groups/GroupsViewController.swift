//
//  GroupsViewController.swift
//  UIL1_v2_Shleykin
//
//  Created by Ivan Shleykin on 06/03/2019.
//  Copyright © 2019 Ivan Shleykin. All rights reserved.
//

import UIKit


class GroupsViewController: UITableViewController, UISearchBarDelegate, UISearchResultsUpdating {

    let searchController = UISearchController(searchResultsController: nil)
    var searchGroup: [Group] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        tableView.tableHeaderView = searchController.searchBar
        searchGroup = groups
        tableView.reloadData()


    }

    @IBAction func didSelectNewGroup(segue: UIStoryboardSegue) {
        if segue.identifier == "AddGroup" {
            let newgroup = segue.source as! OtherGroupsViewController
            
            if let indexPath = newgroup.tableView.indexPathForSelectedRow {
                let group = otherGroups[indexPath.row]
                groups.append(group)
                otherGroups.remove(at: indexPath.row)
                tableView.reloadData()

            }
        }
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

            return searchGroup.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: GroupsViewCell.self), for: indexPath) as! GroupsViewCell

        let group = searchGroup[indexPath.row]
        cell.groupName.text = group.name
        cell.groupImage.image = group.image

        return cell
    }
 


    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let group = searchGroup[indexPath.row]
            otherGroups.append(group)
            searchGroup.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
// MARK: - SearchBarDelegate
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if let searchText = searchBar.text {
            if searchText.isEmpty {
                searchGroup = groups
            }else {
                searchGroup = [];
                for group in groups {
                    if group.name.range(of: searchText) != nil {
                        searchGroup.append(group)
                    }
                }
            }
        }
        tableView.reloadData()
    }
    
//
    func updateSearchResults(for searchController: UISearchController) {
        tableView.reloadData()
    }
   


    
}
