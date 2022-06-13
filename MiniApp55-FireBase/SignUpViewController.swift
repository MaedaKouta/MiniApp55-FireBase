//
//  SignUpViewController.swift
//  MiniApp55-FireBase
//
//  Created by 前田航汰 on 2022/06/13.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    @IBAction func didTapSingnUpButton(_ sender: Any) {
        let mail = mailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        Auth.auth().createUser(withEmail: mail, password: password) { authResult, error in
            if let user = authResult?.user {
                dump(user)
            } else {
                dump(error)
            }
        }
    }

}
