//
//  WelcomeViewController.swift
//  LoginFormMVC
//
//  Created by Кирилл Тараско on 01.05.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    var user: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbl.text = "Welcome \(user ?? "")"
    }
    
}
