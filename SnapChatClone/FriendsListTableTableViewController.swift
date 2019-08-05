//
//  FriendsListTableTableViewController.swift
//  SnapChatClone
//
//  Created by Wilmer sinchi on 7/3/19.
//  Copyright © 2019 Wilmer sinchi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class User {
    var email : String
    var uid : String
    
    init (email: String, uid: String){
        self.email = email
        self.uid = uid
    }
    
}



class FriendsListTableTableViewController: UITableViewController {

    var download = ""
    var users : [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()

//        database()
      
        
      
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }
    
    func database(){
        Database.database().reference().child("users").observe(.childAdded) { (snapshot) in
    
            guard let userDictionary = snapshot.value as? NSDictionary else {return}
            guard let email = userDictionary["email"] as? String else {return}
            let user = User(email: email, uid: snapshot.key)
            
            print(email)
            self.users.append(user)
            self.tableView.reloadData()
            
        }
        
    }
    // MARK: - Table view data source
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print(users.count)
        return users.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let user = users[indexPath.row].email
        cell.textLabel?.text = user
        
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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


