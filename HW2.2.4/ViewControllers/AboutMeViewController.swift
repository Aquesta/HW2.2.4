//
//  AboutMeViewController.swift
//  HW2.2.4
//
//  Created by Геннадий Красношлык on 30.08.2020.
//  Copyright © 2020 Aquesta's. All rights reserved.
//

import UIKit

class AboutMeViewController: UIViewController {
    @IBOutlet var nameOutlet: UILabel!
    @IBOutlet var ageOutlet: UILabel!
    @IBOutlet var myWifeOutlet: UILabel!
    @IBOutlet var mySonOutlet: UILabel!
    @IBOutlet var descriptionOutlet: UILabel!
    @IBOutlet var photoOutlet: UIImageView!
    
    var person: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // navBar title
        self.navigationItem.title = "\(person!.name)"
        
        // надо перенести в функцию, дублируем
        photoOutlet.layer.cornerRadius = photoOutlet.frame.width / 2
        photoOutlet.layer.borderWidth = 2
        photoOutlet.layer.borderColor = UIColor.orange.cgColor
        
        nameOutlet.text = person!.name
        ageOutlet.text = String(person!.age)
        myWifeOutlet.text = person!.wife.name
        mySonOutlet.text = person!.son.name
        descriptionOutlet.text = person!.description
        photoOutlet.image = UIImage(named: person!.photo)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "aboutWifeSegue" {
            guard let familyVC = segue.destination as? FamilyViewController else { return }
            familyVC.user = person!.wife as Family
        } else if segue.identifier == "aboutSonSegue" {
            guard let familyVC = segue.destination as? FamilyViewController else { return }
            familyVC.user = person!.son as Family
        }
    }
}
