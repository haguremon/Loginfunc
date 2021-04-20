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
        registerButton.backgroundColor = UIColor.rgb(red: 180, green: 255, blue: 221)
        emailTextField.delegate = self
        passwordTextField.delegate = self
        userNameTextField.delegate = self
    }
    //画面をタップした時にキーボードを閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
extension ViewController: UITextFieldDelegate { //可読性の向上ｗ
    func textFieldDidChangeSelection(_ textField: UITextField) {
        let emailIsEmpty = emailTextField.text?.isEmpty ?? true
        let passwordIsEmpty = passwordTextField.text?.isEmpty ?? true
        let usernameIsEmpty = userNameTextField.text?.isEmpty ?? true
        if emailIsEmpty || passwordIsEmpty || usernameIsEmpty {
            registerButton.isEnabled = false
            registerButton.backgroundColor = UIColor.rgb(red: 180, green: 255, blue: 221)
        } else {
            registerButton.isEnabled = true
            registerButton.backgroundColor = UIColor.rgb(red: 0, green: 255, blue: 150)
        }
    }
    
    
}
