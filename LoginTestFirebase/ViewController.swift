//
//  ViewController.swift
//  LoginTestFirebase
//
//  Created by IwasakIYuta on 2021/04/19.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet private var emailTextField: UITextField!
    
    @IBOutlet private var passwordTextField: UITextField!
    
    @IBOutlet private var userNameTextField: UITextField!
    
    @IBOutlet private var registerButton: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        registerButton.isEnabled = false
        registerButton.layer.cornerRadius = 10 //角を丸く
        emailTextField.delegate = self
        passwordTextField.delegate = self
        userNameTextField.delegate = self
    }


}
extension ViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
     let emailIsEmpty = emailTextField.text?.isEmpty ?? true
       let passwordIsEmpty = passwordTextField.text?.isEmpty ?? true
       let usernameIsEmpty = userNameTextField.text?.isEmpty ?? true
       if emailIsEmpty || passwordIsEmpty || usernameIsEmpty {
        registerButton.isEnabled = false
    } else {
        registerButton.isEnabled = true
    }
    }
    
    
}
