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
    @IBOutlet var logOutOutlet: UIButton!
    
    var person: Person?

    override func viewDidLoad() {
        super.viewDidLoad()

        welcomeTextOutlet.text = "Welcome, \(person!.name)"
        logOutOutlet.layer.cornerRadius = 20
        
        // Цвет TabBar
        self.tabBarController?.tabBar.tintColor = .orange
    }
}
