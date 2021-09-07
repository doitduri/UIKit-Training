//
//  SeguePushViewController.swift
//  ScreenTransactionExample
//
//  Created by 김두리 on 2021/09/08.
//

import UIKit

class SeguePushViewController: UIViewController {

    @IBAction func tabBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
