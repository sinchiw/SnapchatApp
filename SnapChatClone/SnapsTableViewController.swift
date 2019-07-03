//
//  SnapsTableViewController.swift
//  
//
//  Created by Wilmer sinchi on 6/26/19.
//

import UIKit
import Firebase




class SnapsTableViewController: UITableViewController {
var array = [String]()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
array = ["a","b","c"]
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

//    @IBAction func LogOutAction(_ sender: Any) {
////       try? Auth.auth().signOut()
////        print("log out was success")
////        let transition = CATransition()
////        transition.duration = 0.5
////        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
////        transition.type = CATransitionType.push
////        transition.subtype = CATransitionSubtype.fromLeft
////        self.view.window!.layer.add(transition, forKey: nil)
//        print("button clicked")
////        self.dismiss(animated: true, completion: nil)
//
//    }
    
    
    
    
 
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return array.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = array[indexPath.row]
        return cell!
    }
    
    @IBAction func logOutAction(_ sender: Any) {
        
        try! Auth.auth().signOut()
        print("Logged Out")
                let transition = CATransition()
                transition.duration = 0.5
                transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
                transition.type = CATransitionType.fade
                transition.subtype = CATransitionSubtype.fromLeft
                self.view.window!.layer.add(transition, forKey: nil)
//                self.navigationController?.popToRootViewController(animated: false)
        
        dismiss(animated: false, completion: nil)
    }
    
    

}
