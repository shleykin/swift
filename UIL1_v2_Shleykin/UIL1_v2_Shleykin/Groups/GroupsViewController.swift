//
//  GroupsViewController.swift
//  UIL1_v2_Shleykin
//
//  Created by Ivan Shleykin on 06/03/2019.
//  Copyright © 2019 Ivan Shleykin. All rights reserved.
//

import UIKit

class GroupsViewController: UITableViewController, UISearchBarDelegate {
    
  
    let searchController = UISearchController(searchResultsController: nil)
    var filtredGroup: [Group] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self as? UISearchResultsUpdating
        tableView.tableHeaderView = searchController.searchBar

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
        return groups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: GroupsViewCell.self), for: indexPath) as! GroupsViewCell

        let group = groups[indexPath.row]
        cell.groupName.text = group.name
        cell.groupImage.image = group.image

        return cell
    }
 


    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let group = groups[indexPath.row]
            otherGroups.append(group)
            groups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
       
    }
    
//    class TableViewController: UITableViewController, UISearchResultsUpdating, UISearchBarDelegate {
//
//        private let items = ["Вася", "Света", "Дима", "Рома"]
//        private var result: [String] = []
//
//        private let searchController = UISearchController(searchResultsController: nil)
//
//        private var isSearch: Bool { return searchController.active && !searchController.searchBar.text!.isEmpty }
//
//        override func viewDidLoad() {
//            super.viewDidLoad()
//            searchController.searchResultsUpdater = self
//            searchController.searchBar.delegate = self
//            tableView.tableHeaderView = searchController.searchBar
//        }
//
//        override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            if isSearch {
//                return result.count
//            } else {
//                return items.count
//            }
//        }
//
//        override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//            let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
//
//            var text: String!
//
//            if isSearch {
//                text = result[indexPath.row]
//            } else {
//                text = items[indexPath.row]
//            }
//
//            cell.textLabel?.text = text
//            return cell
//        }
//
//        // MARK: - SearchResultsUpdating
//
//        func updateSearchResultsForSearchController(searchController: UISearchController) {
//            result = items.filter { $0.lowercaseString.containsString(searchController.searchBar.text!.lowercaseString) }
//            tableView.reloadData()
//        }
//
//        // MARK: - SearchBarDelegate
//
//        func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
//            // Start Editing
//        }
//
//        func searchBarTextDidEndEditing(searchBar: UISearchBar) {
//            // End Editing
//        }
//
//    }

    //    var groups: [Group] = []
    //
    //    override func viewDidLoad() {
    //        super.viewDidLoad()
    //
    //        groups = DemoData.groups
    //        tableView.reloadData()
    //
    //        // Uncomment the following line to preserve selection between presentations
    //        // self.clearsSelectionOnViewWillAppear = false
    //
    //        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    //        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    //    }
    //}
    //
    //// MARK: - Search bar delegate
    //extension AllGroupsViewController: UISearchBarDelegate {
    //
    //    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    //        if let searchText = searchBar.text {
    //            if searchText.isEmpty {
    //                groups = DemoData.groups
    //            }else{
    //                groups = [];
    //                for group in DemoData.groups {
    //                    if group.name.range(of: searchText) != nil {
    //                        groups.append(group)
    //                    }
    //                }
    //            }
    //        }
    //        tableView.reloadData()
    //    }
    //
    //}
    
    
}
