//
//  LoginViewController.swift
//  mySmackApp
//
//  Created by Manyuchi, Carrington C on 2025/03/15.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    @IBAction func createAccountButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
    
 
}
