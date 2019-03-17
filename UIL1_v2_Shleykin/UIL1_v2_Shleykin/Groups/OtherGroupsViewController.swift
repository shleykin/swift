//
//  OtherGroupsViewController.swift
//  UIL1_v2_Shleykin
//
//  Created by Ivan Shleykin on 11/03/2019.
//  Copyright © 2019 Ivan Shleykin. All rights reserved.
//



import UIKit

public var otherGroups = [Group(name:"Металлисты",image: #imageLiteral(resourceName: "metal")), Group(name: "Рэперы", image: #imageLiteral(resourceName: "rap")),Group(name: "Фолк", image: #imageLiteral(resourceName: "folk"))]


class OtherGroupsViewController: UIViewController {
    
var groups: [Group] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        groups = otherGroups
        tableView.reloadData()
    }
    

}
extension OtherGroupsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: OtherGroupsViewCell.self), for: indexPath) as! OtherGroupsViewCell
        let group = groups[indexPath.row]
        cell.otherGroupName.text = group.name
        cell.otherGroupImage.image = group.image
        return cell
    }
    
    
}
// MARK: - SearchBarDelegate

extension OtherGroupsViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if let searchText = searchBar.text {
            if searchText.isEmpty {
                groups = otherGroups
            }else {
                groups = [];
                for group in otherGroups {
                    if group.name.range(of: searchText) != nil {
                        groups.append(group)
                    }
                }
            }
        }
        tableView.reloadData()
    }
    
}

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
