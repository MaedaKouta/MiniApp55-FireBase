//
//  LoginViewController.swift
//  MiniApp55-FireBase
//
//  Created by 前田航汰 on 2022/06/13.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    @IBAction func didTapLoginButton(_ sender: Any) {
        let mail = mailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        signIn(mail, password)
    }

    func signIn(_ mail: String, _ password: String) {
        Auth.auth().signIn(withEmail: mail, password: password) { authResult, error in
            if authResult?.user != nil {
                print("成功")
            } else {
                print("失敗")
            }
        }
    }

}


