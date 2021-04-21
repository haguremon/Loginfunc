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
        //キーボードの認識
        NotificationCenter.default.addObserver(self, selector: #selector(showkeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(hidekeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc func showkeyboard(notification: Notification){
        //キーボードのフレームを求める
        let keyboardFrame = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as AnyObject).cgRectValue
        //https://qiita.com/st43/items/3802624d15a8dded8169 //フレームについて
        guard let kayboardMinY = keyboardFrame?.minY else { return } //キーボードの高さ
        let registerButtonMaxY = registerButton.frame.maxY //registerButtonの底辺の位置
        let distance = registerButtonMaxY - kayboardMinY + 30
        let transform = CGAffineTransform(translationX: 0, y: -distance)
        //https://qiita.com/hachinobu/items/57d4c305c907805b4a53 //Animation
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
            self.view.transform = transform
        })
        //print("kayboardMinY: \(String(describing: kayboardMinY)), registerButtonMaxY: \(registerButtonMaxY)")
    }
    @objc func hidekeyboard(){
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
            self.view.transform = .identity
        })
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
