//
//  SearchUsersTableViewController.swift
//  SupLogin
//
//  Created by Bill Gustafsson on 2021-03-25.
//  Copyright © 2021 Fabian. All rights reserved.
//

import UIKit
import FirebaseDatabase

class SearchUsersTableViewController: UITableViewController, UISearchResultsUpdating {

    
    let searchcontroller = UISearchController(searchResultsController: nil)
    
    @IBOutlet var searchUsersTableView: UITableView!
    var usersArray = [NSDictionary?]()
    var filteredUsers = [NSDictionary?]()
    
    var databaseRef = FirebaseDatabase.DatabaseReference()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


        
        // Searchbar for users
        searchcontroller.searchResultsUpdater = self
        definesPresentationContext = true
        tableView.tableHeaderView = searchcontroller.searchBar
        
        databaseRef.child("users_profiles").queryOrdered(byChild: "name").observe(.childAdded, with: { (snapshot) in
            
            self.usersArray.append(snapshot.value as? NSDictionary)
            
           
            // Insert the rows
            
            self.searchUsersTableView.insertRows(at: [IndexPath(row: self.usersArray.count-1, section: 0)], with: UITableView.RowAnimation.automatic)
        } ) { (Error) in
            print(Error.localizedDescription)
        }
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if searchcontroller.isActive && searchcontroller.searchBar.text != "" {
            return filteredUsers.count
        }
        return self.usersArray.count
        }
    

    
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        
        let user : NSDictionary?
        
        if searchcontroller.isActive && searchcontroller.searchBar.text != "" {
            
            user = filteredUsers[indexPath.row]
        }
        else {
            user = self.usersArray[indexPath.row]
        }
    cell.textLabel?.text = user?["name"] as? String
    cell.detailTextLabel?.text = user?["handle"] as? String
    
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

  
    @IBAction func dismissSearchUsersTableView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContent(searchText: self.searchcontroller.searchBar.text!)
    }
    
    
    func filterContent(searchText: String) {
        self.filteredUsers = self.usersArray.filter{ user in
            
            let username = user!["name"] as? String
        
            return (username?.lowercased().contains(searchText.lowercased()))!
        }
        tableView.reloadData()
    }
}

