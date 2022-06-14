//
//  AddTweetViewController.swift
//  MiniApp55-FireBase
//
//  Created by 前田航汰 on 2022/06/14.
//

import UIKit
import FirebaseAuth

class AddTweetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapLogoutButton(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            print("ログアウト")
            self.dismiss(animated: true)
        } catch let signOutError as NSError {
            print("SignOut Error: %@", signOutError)
        }
    }

}
