//
//  FamilyViewController.swift
//  HW2.2.4
//
//  Created by Геннадий Красношлык on 30.08.2020.
//  Copyright © 2020 Aquesta's. All rights reserved.
//

import UIKit

class FamilyViewController: UIViewController {

    @IBOutlet var photoOutlet: UIImageView!
    @IBOutlet var nameOutlet: UILabel!
    @IBOutlet var ageOutlet: UILabel!
    @IBOutlet var descriptionOutlet: UILabel!
    
    var name:String?
    var age:Int?
    var descriptionVar:String?
    var photo:String?
    
    var user:Family?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoOutlet.layer.cornerRadius = photoOutlet.frame.width / 2
        photoOutlet.layer.borderWidth = 2
        photoOutlet.layer.borderColor = UIColor.orange.cgColor
        
        nameOutlet.text = user!.name
        ageOutlet.text = String(user!.age)
        descriptionOutlet.text = user!.description
        photoOutlet.image = UIImage(named: user!.photo)
    }
}
