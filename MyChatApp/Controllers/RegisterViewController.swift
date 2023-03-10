//
//  RegisterViewController.swift
//  Chat's app
//
//  Created by иван Бирюков on 09.03.2023.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print("while registration process was some error \(e.localizedDescription)")
                } else {
                    print("Registration has complited succesfully")
                    self.performSegue(withIdentifier: K.registerToChat, sender: self)
                }
            }
        }
    }
}
