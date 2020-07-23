//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore
class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    let db = Firestore.firestore()
    var messages: [Message] = [
        Message(sender: "1@2.com", body: "Hey!"),
        Message(sender: "a@b.com", body: "Yooo!"),
        Message(sender: "g@h.com", body: "Hiiii!")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        title = "⚡️FlashChat"
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
      
        loadData()
    }
    
    func loadData()
    {
        messages = []
        db.collection(K.FStore.collectionName).getDocuments { (querySnapshot, error) in
            if let e=error{
                print("There was an issue retreiving data from firestore")
            }else{
//                querySnapshot?.documents
            }
        }
    }

    
    @IBAction func sendPressed(_ sender: UIButton) {
        if let messageBody = messageTextfield.text, let sender = Auth.auth().currentUser?.email{
            db.collection(K.FStore.collectionName).addDocument(data: [
                K.FStore.senderField: sender,
                K.FStore.bodyField: messageBody
            ]){ (error) in
                if let e = error{
                    print("There was an error, \(e)")
                }
                else{
                    print("Succesfully Saved!!")
                    self.messageTextfield.text = ""
                }
            }
            
        }
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

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath)
                as! MessageCell
        cell.label.text = messages[indexPath.row].body
        return cell
    }
}

