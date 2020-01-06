//
//  EmailData.swift
//  EmailDemo
//
//  Created by Nirav Bavishi on 2020-01-06.
//  Copyright © 2020 Nirav Bavishi. All rights reserved.
//

import Foundation


class EmailData {
    
    var receivedEmails : [[String: String]]
    var sentEmail : [[String: String]]
    var archieveEmail : [[String: String]]
    var emailData : [[String: String]]
    let udefault = UserDefaults.standard
    
    init() {
        
        
        receivedEmails = []
          
           sentEmail = []
          
           archieveEmail = []
        
        
        self.emailData = [["srno": "1","sender":"Nirav","username": "User 1", "subject": "Subject 1 Rec", "body": "Body 1", "isreceived": "1", "isSent": "0", "isArchieved": "0"], ["srno": "2","username": "User 2", "subject": "Subject 2 Rec", "body": "Body 2", "isreceived": "1", "isSent": "0", "isArchieved": "0","sender":"Nirav"], ["srno": "3","username": "User 3", "subject": "Subject 3 Rec", "body": "Body 3", "isreceived": "1", "isSent": "0", "isArchieved": "0","sender":"Nirav"],
          
                                 ["srno": "4","username": "User 4", "subject": "Subject 4 Rec", "body": "Body 4", "isreceived": "0", "isSent": "1", "isArchieved": "0","sender":"Nirav"], ["srno": "5","username": "User 5", "subject": "Subject 5 Rec", "body": "Body 5", "isreceived": "0", "isSent": "1", "isArchieved": "0","sender":"Nirav"], ["srno": "6","username": "User 6", "subject": "Subject 6 Rec", "body": "Body 6", "isreceived": "0", "isSent": "1", "isArchieved": "0","sender":"Nirav"],
              
              ["srno": "7","username": "User 7", "subject": "Subject 7 Rec", "body": "Body 7", "isreceived": "0", "isSent": "0", "isArchieved": "1","sender":"Nirav"], ["srno": "8","username": "User 8", "subject": "Subject 8 Rec", "body": "Body 8", "isreceived": "0", "isSent": "0", "isArchieved": "1","sender":"Nirav"], ["srno": "9","username": "User 9", "subject": "Subject 9 Rec", "body": "Body 9", "isreceived": "0", "isSent": "0", "isArchieved": "1","sender":"Nirav"]
                                 
          ]
          
        if(udefault.array(forKey: "EmailData") == nil){
            udefault.set(emailData, forKey: "EmailData")
    }
        
        
    }
    
    
    

  
    
    
    
    func getReceiveEmails() -> [[String:String]]{
        
        var data :[[String:String]] = udefault.array(forKey: "EmailData") as! [[String : String]]
        receivedEmails.removeAll()
        
        for email in data{
            if(email["isreceived"] == "1"){

                receivedEmails.append(email)
                
            }
        }
        
        return receivedEmails
        
    }
    func getsentEmails() -> [[String:String]]{
        
        sentEmail.removeAll()
        var data :[[String:String]] = udefault.array(forKey: "EmailData") as! [[String : String]]
              
              
              for email in data{
                  if(email["isSent"] == "1"){

                      sentEmail.append(email)
                      
                  }
        }
        
           
           return sentEmail
           
       }
    func getArchieveEmails() -> [[String:String]]{
           
        archieveEmail.removeAll()
        var data :[[String:String]] = udefault.array(forKey: "EmailData") as! [[String : String]]
                   
                   
                   for email in data{
                       if(email["isArchieved"] == "1"){

                           archieveEmail.append(email)
                           
                       }
             }
        
        
           return archieveEmail
           
       }
    
    func deleteReceivedEmail(srno: String) -> [[String:String]]{
          var data :[[String:String]] = udefault.array(forKey: "EmailData") as! [[String : String]]
        var index = 0
        for email in data{
            
            if(email["srno"] == srno)
            {
                data.remove(at: index)
            }
            index += 1
            
        }
        udefault.set(data, forKey: "EmailData")
        
        return getReceiveEmails()
        
    }
    
    func deleteSentEmail(srno:String) -> [[String:String]]{
           
           var data :[[String:String]] = udefault.array(forKey: "EmailData") as! [[String : String]]
                var index = 0
                for email in data{
                    
                    if(email["srno"] == srno)
                    {
                        data.remove(at: index)
                    }
                    index += 1
                    
                }
                udefault.set(data, forKey: "EmailData")
           return getsentEmails()
           
       }
    
    func deleteArchieveEmail(srno:String) -> [[String:String]]{
           
              var data :[[String:String]] = udefault.array(forKey: "EmailData") as! [[String : String]]
                var index = 0
                for email in data{
                    
                    if(email["srno"] == srno)
                    {
                        data.remove(at: index)
                    }
                    index += 1
                    
                }
                udefault.set(data, forKey: "EmailData")
           return getArchieveEmails()
           
       }
    
    func receiveToArchieveEmail(srno:String) -> [[String:String]]{
        
        var data :[[String:String]] = udefault.array(forKey: "EmailData") as! [[String : String]]
        print("srno\(srno)")
        var index = 0
        for var email in data{
            
            if(email["srno"] == srno){
                
                data[index]["isreceived"] = "0"
                data[index]["isArchieved"] = "1"
                
            }
            index += 1
        }
        udefault.set(data, forKey: "EmailData")
        print(udefault.array(forKey: "EmailData"))
        return getReceiveEmails()
        
    }
    
    func archieveToReceiveEmail(srno:String) -> [[String:String]]{
           
        var data :[[String:String]] = udefault.array(forKey: "EmailData") as! [[String : String]]
        var index = 0
        for var email in data{
            
            if(email["srno"] == srno){
                
                data[index]["isreceived"] = "1"
                data[index]["isArchieved"] = "0"
                
            }
            index += 1
        }
        udefault.set(data, forKey: "EmailData")
        
           
           return getArchieveEmails()
           
       }
    
    
}
