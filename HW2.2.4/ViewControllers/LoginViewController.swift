//
//  ViewController.swift
//  HW2.2.4
//
//  Created by Геннадий Красношлык on 28.08.2020.
//  Copyright © 2020 Aquesta's. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var singInButton: UIButton!
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // инициализируем пользователя
    private var user = Login()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        singInButton.layer.cornerRadius = 20
    }
    
    // передаем на TabBarVC значения username
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loginSegue" {
            guard let tabBarControllers = segue.destination as? UITabBarController else { return }
            guard let welcomeVC = tabBarControllers.viewControllers?.first as? WelcomeViewController else { return }
            welcomeVC.person = user.person
            // передаем во вьюху aboutMe
            guard let navBarVC = tabBarControllers.viewControllers?.last as? UINavigationController else { return }
            guard let aboutMeVC = navBarVC.viewControllers.first as? AboutMeViewController else { return }
            aboutMeVC.person = user.person
        }
    }
    
    // скрываем клавиатуру по тапу на экране
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // обработка кнопки Sing In
    @IBAction func singInAction() {
         checkAuthorization()
    }
    
    // кнопки забыли пароль и логин
    @IBAction func forgotButtonsAction(_ sender: UIButton) {
        if sender.tag == 1 {
            showAlert(with: "The username is", and: user.login)
        } else {
            showAlert(with: "The password is", and: user.password)
        }
    }
    
    // реализуем метод unwind с кнопки LogOut и очищаем поля username / password
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        loginTextField.text = ""
        passwordTextField.text = ""
    }
    
    //  Обработка кнопок next & done на клавиатуре
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField == loginTextField {
            loginTextField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            checkAuthorization()
        }
        return true
    }

    // метод авторизации - проверка заполнения полей, переход на tabBarVC
    private func checkAuthorization() {
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
}

// MARK: - Alert Controller

extension LoginViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
