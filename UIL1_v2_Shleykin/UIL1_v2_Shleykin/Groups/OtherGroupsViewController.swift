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
