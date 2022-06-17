//
//  LoginViewController.swift
//  MiniApp55-FireBase
//
//  Created by 前田航汰 on 2022/06/13.
//

import UIKit
import FirebaseAuth
import Firebase
import GoogleSignIn

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

    @IBAction func didTapSoginButton(_ sender: Any) {
        auth()
    }

    private func auth() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let config = GIDConfiguration(clientID: clientID)

        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] user, error in
            if let error = error {
                print("GIDSignInError: \(error.localizedDescription)")
                return
            }

            guard let authentication = user?.authentication,
                  let idToken = authentication.idToken else { return }

            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
            self.login(credential: credential)
        }
    }
    private func login(credential: AuthCredential) {
        print("ログイン完了")
    }

}


