//
//  EnterEmailViewController.swift
//  SopotifyLoginSampleApp
//
//  Created by 김두리 on 2021/09/17.
//

import UIKit

class EnterEmailViewController: UIViewController {
        
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet var errorMessageLabel: UIView!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 네비게이션 바 보이기
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLoad() {
        nextButton.layer.cornerRadius = 30
        nextButton.isEnabled = false
        
        // email, password 값을 가져오기 위해서 delegate 사용해야함
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        // 커서가 email text field로 focus
        emailTextField.becomeFirstResponder()
    }
    
    @IBAction func tabNextButton(_ sender: UIButton) {
    }
}

extension EnterEmailViewController: UITextFieldDelegate {
    
    // 이메일 입력이 끝났을 경우 키보드가 내려가도록 설정
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
    
    // email, password 입력 값이 잇는 경우 [다음] 버튼 활성화
    func textFieldDidEndEditing(_ textField: UITextField) {
        let isEmailEmpty = emailTextField.text == ""
        let isPasswordEmpty = passwordTextField.text == ""
        
        nextButton.isEnabled = !isEmailEmpty && !isPasswordEmpty
    }
}
