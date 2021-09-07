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
    
    
    // MARK Life-Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad - 뷰가 로드 됐어")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear - 뷰가 나타날꺼야")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear - 뷰가 나타났어")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear - 뷰가 곧 사라질꺼야..")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear - 뷰가 사라졌어")
    }
}

