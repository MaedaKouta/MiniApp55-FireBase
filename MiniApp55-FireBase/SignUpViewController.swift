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

    override func viewDidLoad() {
        super.viewDidLoad()
        Auth.auth().languageCode = "ja_JP"
    }

    @IBAction func didTapSingnUpButton(_ sender: Any) {
        let mail = mailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        signUp(mail, password)
    }

    func signUp(_ mail: String, _ password: String) {
        Auth.auth().createUser(withEmail: mail, password: password) { authResult, error in

            if let error = error as NSError?, let errorCode = AuthErrorCode.Code(rawValue: error.code) {
                switch errorCode {
                case .invalidEmail:
                    print("メールアドレスが正しくありません")
                case .emailAlreadyInUse:
                    print("メールアドレスは既に登録されています")
                case .weakPassword:
                    print("パスワードは６文字以上で入力してください")
                default:
                    print(error.domain)
                }
            }

            // TODO: メール認証しなくてもアカウント作れてしまう。なぜ...
            if let user = authResult?.user {
                print("通貨")
                user.sendEmailVerification(completion: { error in
                    if error == nil {
                        print("送信成功しました")
                    } else {
                        print("メール失敗")
                    }
                })
            }

        }
    }

    @IBAction func didTapSingnInButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}

