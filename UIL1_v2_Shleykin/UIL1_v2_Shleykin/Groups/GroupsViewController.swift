//
//  GroupsViewController.swift
//  UIL1_v2_Shleykin
//
//  Created by Ivan Shleykin on 06/03/2019.
//  Copyright © 2019 Ivan Shleykin. All rights reserved.
//

import UIKit

class GroupsViewController: UITableViewController {
    
    var groups =    [
        "Котики",
        "Собачки",
        "Лошадки",
        "Ёжики"
        ]

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func didSelectNewGroup(segue: UIStoryboardSegue) {
        if segue.identifier == "AddGroup" {
            let newgroup = segue.source as! OtherGroupsViewController
            
            if let indexPath = newgroup.tableView.indexPathForSelectedRow {
                //let group = newgroup.otherGroups[indexPath.row]
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
        cell.groupName.text = group

        return cell
    }
 


    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let group = groups[indexPath.row]
            otherGroups.append(group)
            groups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
