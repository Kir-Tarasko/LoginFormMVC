//
//  LogInViewController.swift
//  LoginFormMVC
//
//  Created by Кирилл Тараско on 01.05.2022.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.delegate = self
        usernameTextField.tag = 0
        usernameTextField.returnKeyType = .next
        passwordTextField.delegate = self
        passwordTextField.returnKeyType = .done
        passwordTextField.tag = 1
        registerKeyboardNotification()
        hideKeyboardWhenTappedAround()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        let viewControllers = tabBarController.viewControllers
        for viewController in viewControllers ?? [] {
            if let welcomeVC = viewController as? WelcomeViewController {
                
            } else if let navigationVC = viewController as? UINavigationController {
                let aboutUserVC = navigationVC.topViewController as! UserInfoViewController }
            
        }
    }
    
    deinit {
        removeKeyboardNotification()
    }
    
    @IBAction func loginButtonPressed() {
        if usernameTextField.text != "Kirill" || passwordTextField.text != "Password" {
            showAlert(title: "Error", message: "Wrong username or password", textfield: passwordTextField)
        }
    }
    
    @IBAction func forgotRegisterData(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Error", message: "Your username is")
        : showAlert(title: "", message: "Your password is")
    }
    
    @IBAction func unwind(_ seg: UIStoryboardSegue) {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField, usernameTextField.text != "" {
            nextField.becomeFirstResponder()
        } else if textField == self.passwordTextField {
            textField.resignFirstResponder()
            loginButtonPressed()
            performSegue(withIdentifier: "logIn", sender: nil)
        }
        return true
    }
}
extension LogInViewController {
    private func showAlert(title: String, message: String, textfield: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertOk = UIAlertAction(title: "Ok", style: .default) { _ in
            textfield?.text = ""
        }
        alert.addAction(alertOk)
        present(alert, animated: true)
    }
}

extension LogInViewController {
    private func registerKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func removeKeyboardNotification() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: Notification) {
        self.view.frame.origin.y = -150
        
    }
    
    @objc private func keyboardWillHide(notification: Notification) {
        self.view.frame.origin.y = 0
    }
    
    private func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(LogInViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}
