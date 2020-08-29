//
//  ViewController.swift
//  HW2.2.4
//
//  Created by Геннадий Красношлык on 28.08.2020.
//  Copyright © 2020 Aquesta's. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var singInButton: UIButton!
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    var user = Authorization()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        singInButton.layer.cornerRadius = 20
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loginSegue" {
            guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
            welcomeVC.userName = user.login
        }
    }
    
    @IBAction func singInAction() {
        
        
        guard let login = loginTextField.text, !login.isEmpty else {
            showAlert(with: "Username is empty", and: "Please enter username")
            return
        }
        
        guard let password = passwordTextField.text, !password.isEmpty else {
            showAlert(with: "Password is empty", and: "Please enter password")
            return
        }
        
        guard login == user.login else {
            showAlert(with: "Username is wrong", and: "Please enter correct username")
            return
        }
        
        guard password == user.password else {
            showAlert(with: "Password is wrong", and: "Please enter correct password")
            return
        }
        
        self.performSegue(withIdentifier: "loginSegue", sender: self)
        
    }
    
    @IBAction func forgotButtonsAction(_ sender: UIButton) {
        if sender.tag == 1 {
            showAlert(with: "The username is", and: "Gennady")
        } else {
            showAlert(with: "The password is", and: "Password")
        }
    }
    
    
}

// MARK: - Alert Controller

extension ViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
