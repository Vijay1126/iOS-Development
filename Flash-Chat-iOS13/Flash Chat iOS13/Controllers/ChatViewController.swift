//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth
class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        title = "⚡️FlashChat"
        

    }
    

    
    @IBAction func sendPressed(_ sender: UIButton) {
    }
    
    @IBAction func LogOutPressed(_ sender: UIBarButtonItem) {
        print("Entered")
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
          print("Logout succesfull")
          navigationController?.popToRootViewController(animated: true)
            
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
    }
    
}
