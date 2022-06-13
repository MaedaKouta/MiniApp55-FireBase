//
//  ViewController.swift
//  MiniApp55-FireBase
//
//  Created by 前田航汰 on 2022/06/12.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }

    @IBAction func didTapLoginButton(_ sender: Any) {
    }

    func login() {
        Auth.auth().signInAnonymously {(result, error) in
            
        }
        }

    }
}

