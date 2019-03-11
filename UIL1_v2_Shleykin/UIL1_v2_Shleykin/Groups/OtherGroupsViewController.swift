//
//  OtherGroupsViewController.swift
//  UIL1_v2_Shleykin
//
//  Created by Ivan Shleykin on 11/03/2019.
//  Copyright © 2019 Ivan Shleykin. All rights reserved.
//



import UIKit



class OtherGroupsViewController: UIViewController {
    
var otherGroups = [Group(name:"Металлисты",image: #imageLiteral(resourceName: "metal")), Group(name: "Рэперы", image: #imageLiteral(resourceName: "rap")),Group(name: "Фолк", image: #imageLiteral(resourceName: "folk"))]
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    
    
}
extension OtherGroupsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return otherGroups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: OtherGroupsViewCell.self), for: indexPath) as! OtherGroupsViewCell
        let group = otherGroups[indexPath.row]
        cell.otherGroupName.text = group.name
        cell.otherGroupImage.image = group.image
        return cell
    }
    
    
}
