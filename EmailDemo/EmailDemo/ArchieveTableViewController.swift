//
//  ArchieveTableViewController.swift
//  EmailDemo
//
//  Created by Nirav Bavishi on 2020-01-06.
//  Copyright © 2020 Nirav Bavishi. All rights reserved.
//

import UIKit

class ArchieveTableViewController: UITableViewController {

    let emailData = EmailData()
    let user = UserDefaults.standard
    lazy var archieveEmails = emailData.getArchieveEmails()
    
    override func viewDidLoad() {
        super.viewDidLoad()
 print(user.array(forKey: "EmailData"))
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete", handler: {action,view,actionPerformed in
            
            print("\(indexPath.row) Deleted")
            self.archieveEmails = self.emailData.deleteArchieveEmail(srno: self.archieveEmails[indexPath.row]["srno"]!)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            actionPerformed(true)
            self.tableView.reloadData()

            let alert = UIAlertController(title: "Alert", message: "Email Deleted Successfully", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alert,animated: true, completion: nil)
            
        })
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let moveToInbox = UIContextualAction(style: .normal, title: "Move To Inbox", handler: {action, view, actionPerformed in
            
            self.archieveEmails = self.emailData.archieveToReceiveEmail(srno: self.archieveEmails[indexPath.row]["srno"]!)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            actionPerformed(true)
            self.tableView.reloadData()
            
            let alert = UIAlertController(title: "Alert", message: "Email moved to Inbox Successfully", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alert,animated: true, completion: nil)
        })
        
        return UISwipeActionsConfiguration(actions: [moveToInbox])
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return archieveEmails.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
           let cell = tableView.dequeueReusableCell(withIdentifier: "archieveCell", for: indexPath)
                         cell.textLabel?.text = archieveEmails[indexPath.row]["username"]
                         cell.detailTextLabel?.text = archieveEmails[indexPath.row]["subject"]
                         return cell
           
       }

   
}
