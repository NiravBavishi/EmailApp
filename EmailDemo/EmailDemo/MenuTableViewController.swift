//
//  MenuTableViewController.swift
//  EmailDemo
//
//  Created by Nirav Bavishi on 2020-01-06.
//  Copyright © 2020 Nirav Bavishi. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
    enum MenuType:Int {
        case inbox
        case sent
        case archive
    }

    var didTapedMenuType: ((MenuType) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

   
   

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuType = MenuType(rawValue: indexPath.row) else {return}
        
        navigationController?.popViewController(animated: true)
        dismiss(animated: true) { [weak self] in
            print("Dismissing: \(menuType)")
            self?.didTapedMenuType?(menuType)
        }
        
        switch indexPath.row {
        case 1:
            performSegue(withIdentifier: "segSent", sender: self)
        case 2:
            performSegue(withIdentifier: "segArchieve", sender: self)
        case 3:
            performSegue(withIdentifier: "segCompose", sender: self)
        default:
            return
        }
        
    }

}
