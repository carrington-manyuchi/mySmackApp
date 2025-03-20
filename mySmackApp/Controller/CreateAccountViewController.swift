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
    
    //Variables
    var avatarname = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 0.1]"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func dismissButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != "" {
            userImg.image = UIImage(named: UserDataService.instance.avatarName)
            avatarname = UserDataService.instance.avatarName
        }
    }
    
    @IBAction func createAccountPressed(_ sender: UIButton) {
        guard let name = usernameTextfield.text, usernameTextfield.text != "" else { return }
        
        guard let email = emailTextfield.text, emailTextfield.text != "" else { return }
        guard let password = passwordTextfield.text, passwordTextfield.text != "" else { return }
        
        AuthService.instance.registerUser(email: email, password: password) { success in
            if success {
                AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarname, avatarColor: self.avatarColor) { success in
                    if success {
                        print(UserDataService.instance.name, UserDataService.instance.avatarName)
                        self.performSegue(withIdentifier: UNWIND, sender: nil)
                    }
                }
            }
        }
    }
    
    @IBAction func pickAvatarPressed(_ sender: UIButton) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    
    @IBAction func pickBackgroundColorPressed(_ sender: UIButton) {
    }
    
    
    
}
