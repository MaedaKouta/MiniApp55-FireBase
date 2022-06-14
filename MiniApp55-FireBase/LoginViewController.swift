//
//  LoginViewController.swift
//  MiniApp55-FireBase
//
//  Created by 前田航汰 on 2022/06/13.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapLoginButton(_ sender: Any) {
    }

    func login() {
        Auth.auth().signInAnonymously {(result, error) in

        }
    }

}


