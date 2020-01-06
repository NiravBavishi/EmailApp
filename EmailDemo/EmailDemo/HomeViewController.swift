//
//  ViewController.swift
//  EmailDemo
//
//  Created by Nirav Bavishi on 2020-01-06.
//  Copyright © 2020 Nirav Bavishi. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    
    @IBOutlet weak var tableView: UITableView!
    
    let user = UserDefaults.standard
    
    
    
        let emailData = EmailData()
        lazy var receiveEmails = emailData.getReceiveEmails()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        print("Print 1")
        
//        print(user.array(forKey: "EmailData"))
        // Do any additional setup after loading the view.
       
        
    }
    override func viewWillAppear(_ animated: Bool) {
        receiveEmails = emailData.getReceiveEmails()
        tableView.reloadData()
        print("2")
    }
  
    override func viewDidDisappear(_ animated: Bool) {
         receiveEmails = emailData.getReceiveEmails()
               tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return receiveEmails.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = receiveEmails[indexPath.row]["username"]
        cell.detailTextLabel?.text = receiveEmails[indexPath.row]["subject"]
        return cell
       }
    
    
    
     func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete", handler: {action,view,actionPerformed in
            
            print("\(indexPath.row) Deleted")
            self.receiveEmails = self.emailData.deleteReceivedEmail(srno: (self.receiveEmails[indexPath.row]["srno"] ?? nil)!)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            actionPerformed(true)
            tableView.reloadData()

            let alert = UIAlertController(title: "Alert", message: "Email Deleted Successfully", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alert,animated: true, completion: nil)
        })
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    
    
     func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let moveToInbox = UIContextualAction(style: .normal, title: "Move To Archieve", handler: {action, view, actionPerformed in
            
            self.receiveEmails = self.emailData.receiveToArchieveEmail(srno: self.receiveEmails[indexPath.row]["srno"]!)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            actionPerformed(true)
            tableView.reloadData()
            let alert = UIAlertController(title: "Alert", message: "Email Moved to Archieve Successfully", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alert,animated: true, completion: nil)
            
        })
        
        return UISwipeActionsConfiguration(actions: [moveToInbox])
        
    }
    
    
}

