//
//  ChannelViewController.swift
//  mySmackApp
//
//  Created by Manyuchi, Carrington C on 2025/03/15.
//

import UIKit

class ChannelViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 100
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        modalPresentationStyle = .fullScreen
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }
    
}
