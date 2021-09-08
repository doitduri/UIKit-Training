//
//  SeguePushViewController.swift
//  ScreenTransactionExample
//
//  Created by 김두리 on 2021/09/08.
//

import UIKit

class SeguePushViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBAction func tabBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    var name: String?
    
    
    // MARK Life-Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Segue viewDidLoad - 뷰가 로드 됐어")
        
        if let name = name {
            self.nameLabel.text = name
            self.nameLabel.sizeToFit()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Segue viewWillAppear - 뷰가 나타날꺼야")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Segue viewDidAppear - 뷰가 나타났어")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Segue viewWillDisappear - 뷰가 곧 사라질꺼야..")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("Segue viewDidDisappear - 뷰가 사라졌어")
    }
}
