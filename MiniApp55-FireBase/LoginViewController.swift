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
            if let user = authResult?.user{
                if user.isEmailVerified == false {
                    print("メール認証を済ませよ")
                    return
                }
                print("成功")
                let storyboard: UIStoryboard = self.storyboard!
                let nextView = storyboard.instantiateViewController(withIdentifier: "AddTweetViewController") as! AddTweetViewController
                self.present(nextView, animated: true, completion: nil)

            } else {
                print("失敗")
            }
        }
    }

}


