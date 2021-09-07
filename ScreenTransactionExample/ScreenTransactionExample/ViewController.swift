//
//  ViewController.swift
//  ScreenTransactionExample
//
//  Created by 김두리 on 2021/09/08.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func tabCodePushButton(_ sender: UIButton) {
        // 스토리보드에 잇는 뷰 컨트롤러를 인스턴스호 ㅏ해야 함
        guard let viewController = self.storyboard?.instantiateViewController(identifier: "CodePushViewController") else {
            return
        }
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func tabCodePresentButton(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(identifier: "CodePresentViewController") else {
            return
        }
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

