//
//  WelcomeViewController.swift
//  HW2.2.4
//
//  Created by Геннадий Красношлык on 29.08.2020.
//  Copyright © 2020 Aquesta's. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeTextOutlet: UILabel!
   
    var tabBar:UITabBar?
    var userName:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeTextOutlet.text = "Welcome, \(userName!)"
        tabBar = self.tabBarController?.tabBar
        tabBar?.tintColor = .orange
    }
    @IBAction func logOutAction() {
        performSegue(withIdentifier: "unwindSegue", sender: self)
    }
}

