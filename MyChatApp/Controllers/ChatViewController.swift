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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Chat App 💬"
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func sendButtonPressed(_ sender: UIButton) {
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
