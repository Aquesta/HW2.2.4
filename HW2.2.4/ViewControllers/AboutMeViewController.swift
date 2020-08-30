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
    
    private let me = Person()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // navBar title
        self.navigationItem.title = "\(me.name)"
        
        // надо перенести в функцию, дублируем
        photoOutlet.layer.cornerRadius = photoOutlet.frame.width / 2
        photoOutlet.layer.borderWidth = 2
        photoOutlet.layer.borderColor = UIColor.orange.cgColor
        
        nameOutlet.text = me.name
        ageOutlet.text = String(me.age)
        myWifeOutlet.text = me.wife.name
        mySonOutlet.text = me.son.name
        descriptionOutlet.text = me.description
        photoOutlet.image = UIImage(named: me.photo)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "aboutWifeSegue" {
            guard let familyVC = segue.destination as? FamilyViewController else { return }
            familyVC.user = me.wife as Family
        } else if segue.identifier == "aboutSonSegue" {
            guard let familyVC = segue.destination as? FamilyViewController else { return }
            familyVC.user = me.son as Family
        }
    }
}
