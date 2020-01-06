//
//  ComposeViewController.swift
//  EmailDemo
//
//  Created by Nirav Bavishi on 2020-01-06.
//  Copyright © 2020 Nirav Bavishi. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var subjectTF: UITextField!
    
    @IBOutlet weak var bodyTV: UITextView!
    
    let uDefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendTapped(_ sender: Any) {
        
        var data :[[String:String]] = uDefault.array(forKey: "EmailData") as! [[String : String]]
        let no =  Int(data.last!["srno"]!)! + 1
        let srno = String(no)
        let username = emailTF.text
        let subject = subjectTF.text
        let body = bodyTV.text
        
        data.append(["srno":srno, "username": username!, "subject": subject!, "body": body!, "isreceived":"1","isSent":"1", "isArchieved": "0"])
        	uDefault.set(data, forKey: "EmailData")
        navigationController?.popViewController(animated: true)

        dismiss(animated: true, completion: nil)
        
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
