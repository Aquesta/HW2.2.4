//
//  ViewController.swift
//  HW2.2.4
//
//  Created by Геннадий Красношлык on 28.08.2020.
//  Copyright © 2020 Aquesta's. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var singInButton: UIButton!
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private var user = Authorization()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        singInButton.layer.cornerRadius = 20
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loginSegue" {
            guard let tabBarController = segue.destination as? UITabBarController else { return }
            guard let welcomeVC = tabBarController.viewControllers?.first as? WelcomeViewController else { return }
            welcomeVC.userName = user.login as String
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func singInPressed(_ sender: UIButton) {
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
        
        performSegue(withIdentifier: "loginSegue", sender: self)
    }
    
    @IBAction func forgotButtonsAction(_ sender: UIButton) {
        if sender.tag == 1 {
            showAlert(with: "The username is", and: "Gennady")
        } else {
            showAlert(with: "The password is", and: "Password")
        }
    }

    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        loginTextField.text = ""
        passwordTextField.text = ""
    }
    
//    private func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
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
