//
//  OtherGroupsViewController.swift
//  UIL1_v2_Shleykin
//
//  Created by Ivan Shleykin on 11/03/2019.
//  Copyright © 2019 Ivan Shleykin. All rights reserved.
//



import UIKit


class OtherGroupsViewController: UIViewController {
    
var groupsFiltred: [Group] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        groupsFiltred = otherGroups
        tableView.reloadData()
    }
    

}
extension OtherGroupsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupsFiltred.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: OtherGroupsViewCell.self), for: indexPath) as! OtherGroupsViewCell
        let group = groupsFiltred[indexPath.row]
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
                groupsFiltred = otherGroups
            }else {
                groupsFiltred = [];
                for group in otherGroups {
                    if group.name.range(of: searchText) != nil {
                        groupsFiltred.append(group)
                    }
                }
            }
        }
        tableView.reloadData()
    }
    
}


