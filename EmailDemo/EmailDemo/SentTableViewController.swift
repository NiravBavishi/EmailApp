//
//  SentTableViewController.swift
//  EmailDemo
//
//  Created by Nirav Bavishi on 2020-01-06.
//  Copyright © 2020 Nirav Bavishi. All rights reserved.
//

import UIKit

class SentTableViewController: UITableViewController {

    let emailData = EmailData()
    lazy var sentEmail = emailData.getsentEmails()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem

    }

    // MARK: - Table view data source

   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return sentEmail.count
        
       
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
          let delete = UIContextualAction(style: .destructive, title: "Delete", handler: {action,view,actionPerformed in
              
              print("\(indexPath.row) Deleted")
              self.sentEmail = self.emailData.deleteSentEmail(srno: self.sentEmail[indexPath.row]["srno"]!)
              tableView.deleteRows(at: [indexPath], with: .automatic)
              actionPerformed(true)
              self.tableView.reloadData()
            let alert = UIAlertController(title: "Alert", message: "Email Deleted Successfully", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alert,animated: true, completion: nil)
              
          })
          return UISwipeActionsConfiguration(actions: [delete])
      }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "sentCell", for: indexPath)
                      cell.textLabel?.text = sentEmail[indexPath.row]["username"]
                      cell.detailTextLabel?.text = sentEmail[indexPath.row]["subject"]
                      return cell
        
    }
    


}
