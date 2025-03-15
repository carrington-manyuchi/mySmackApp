//
//  ChatViewController.swift
//  mySmackApp
//
//  Created by Manyuchi, Carrington C on 2025/03/15.
//

import UIKit

class ChatViewController: UIViewController {


    //MARK: - Outlets
    @IBOutlet weak var menuButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())

    }


}
