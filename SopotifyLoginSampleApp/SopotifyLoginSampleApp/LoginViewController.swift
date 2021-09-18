//
//  LoginViewController.swift
//  SopotifyLoginSampleApp
//
//  Created by 김두리 on 2021/09/17.
//

import UIKit
import GoogleSignIn
import Firebase

class LoginViewController: UIViewController {
   
    @IBOutlet weak var emailLoginButton: UIButton!
    @IBOutlet weak var googleLoginButton: GIDSignInButton!
    @IBOutlet weak var appleLoginButton: UIButton!
    
    @IBAction func tapGoogleLoginButton(_ sender: UIButton) {
    }
    
    @IBAction func tapAppleLoginButton(_ sender: UIButton) {
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 네비게이션 바 숨기기
        navigationController?.navigationBar.isHidden = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let signInConfig = GIDConfiguration.init(clientID: clientID)
        
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { user, error in
            guard error == nil else { return }

            self.googleLoginButton.style = .standard
            // If sign in succeeded, display the app's main content View.
          }
        
        [emailLoginButton, googleLoginButton, appleLoginButton].forEach {
            $0?.layer.borderWidth = 1
            $0?.layer.borderColor = UIColor.white.cgColor
            $0?.layer.cornerRadius = 30
        }
    }
    
    @IBAction func signIn(sender: Any) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let signInConfig = GIDConfiguration.init(clientID: clientID)
        
      GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { user, error in
        guard error == nil else { return }

        // If sign in succeeded, display the app's main content View.
      }
    }
}
