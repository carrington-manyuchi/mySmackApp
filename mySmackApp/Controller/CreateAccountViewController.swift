//
//  CreateAccountViewController.swift
//  mySmackApp
//
//  Created by Manyuchi, Carrington C on 2025/03/15.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    @IBOutlet private weak var usernameTextfield: UITextField!
    @IBOutlet private weak var emailTextfield: UITextField!
    @IBOutlet private weak var passwordTextfield: UITextField!
    @IBOutlet private weak var userImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func dismissButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    @IBAction func createAccountPressed(_ sender: UIButton) {
        guard let email = emailTextfield.text, emailTextfield.text != "" else {
            return
        }
        
        guard let password = passwordTextfield.text, passwordTextfield.text != "" else {
            return
        }
        
        AuthService.instance.registerUser(email: email, password: password) { success in
            if success {
                print("registered user!")
            }
        }
    }
    
    @IBAction func pickAvatarPressed(_ sender: UIButton) {
    }
    
    @IBAction func pickBackgroundColorPressed(_ sender: UIButton) {
    }
    
    
    
}
