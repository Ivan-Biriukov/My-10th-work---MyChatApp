//
//  ChatViewController.swift
//  Chat's app
//
//  Created by иван Бирюков on 09.03.2023.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {
    
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    let db = Firestore.firestore()
    
    var exampleMessages: [Message] = [
        Message(sender: "me", body: "12456"),
        Message(sender: "he", body: "dfsdfsdf"),
        Message(sender: "she", body: "rfgsd")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        title = "Chat App 💬"
        navigationItem.hidesBackButton = true
        tableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
    }
    
    
    @IBAction func sendButtonPressed(_ sender: UIButton) {
        if let messageBody = messageTextField.text, let messageSender = Auth.auth().currentUser?.email {
            db.collection(K.FStore.collectionName).addDocument(data: [K.FStore.senderField: messageSender, K.FStore.bodyField: messageBody]) {(error) in
                if let e = error{
                    print(e.localizedDescription)
                }
            }
        }
        
    }
    
    @IBAction func logoutButtonPressed(_ sender: UIBarButtonItem) {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
}

extension ChatViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        exampleMessages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        cell.messageTextLabel.text = exampleMessages[indexPath.row].body
        return cell
    }
    
    
}
