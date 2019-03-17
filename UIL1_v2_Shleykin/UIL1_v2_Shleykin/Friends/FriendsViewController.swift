//
//  FriendsViewController.swift
//  UIL1_v2_Shleykin
//
//  Created by Ivan Shleykin on 06/03/2019.
//  Copyright © 2019 Ivan Shleykin. All rights reserved.
//

import UIKit

class FriendsViewController: UITableViewController {
    
    var friends = [Friend(name:"Иванов Иван",image: #imageLiteral(resourceName: "2")),Friend(name: "Петров Петр", image: #imageLiteral(resourceName: "1")),Friend(name: "Олегов Олег", image: #imageLiteral(resourceName: "3")),Friend(name: "Артемов Артем", image: #imageLiteral(resourceName: "4")),Friend(name: "Алексеев Алексей", image: #imageLiteral(resourceName: "5"))]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "FriendsHeader", bundle: Bundle.main ), forHeaderFooterViewReuseIdentifier: "FriendsHeader")

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return friends.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendsViewCell

        let friend = friends[indexPath.row]
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
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: "FriendsHeader")
        header?.backgroundView = UIView()
        header?.backgroundView?.backgroundColor = .green
        return header
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
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
