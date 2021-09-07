//
//  SeguePresentViewController.swift
//  ScreenTransactionExample
//
//  Created by 김두리 on 2021/09/08.
//

import UIKit

class SeguePresentViewController: UIViewController {

    @IBAction func tabBackButton(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
