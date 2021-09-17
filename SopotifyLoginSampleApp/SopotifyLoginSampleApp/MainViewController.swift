//
//  MainViewController.swift
//  SopotifyLoginSampleApp
//
//  Created by 김두리 on 2021/09/17.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        // pop 불가
    }
    
    @IBAction func tapLogoutButton(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
