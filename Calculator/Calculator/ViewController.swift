//
//  ViewController.swift
//  Calculator
//
//  Created by 김두리 on 2021/09/17.
//

import UIKit

enum Operation {
    case Add
    case Subtract
    case Divide
    case Multiply
    case unknown
}

class ViewController: UIViewController {

    @IBOutlet weak var numberOutputLabel: UILabel!
    
    var displayNumber = ""
    var firstOperand = "" // 첫번째 피연산자
    var secondOperand = "" // 첫번째 피연산자
    var result = ""
    var currentOperation: Operation = .unknown // 현재 연산자 값 저장하는 프로퍼티
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapNumberButton(_ sender: UIButton) {
        // 숫자 패드를 누르면 보여줄 수 있게 작동 (단, 9자리 까지만)
        
        guard let numberValue = sender.title(for: .normal) else { return }
        if self.displayNumber.count < 9 {
            self.displayNumber += numberValue
            self.numberOutputLabel.text = self.displayNumber
        }
    }
    
    @IBAction func tapClearButton(_ sender: UIButton) {
        self.displayNumber = ""
        self.firstOperand = ""
        self.secondOperand = ""
        self.result = ""
        self.currentOperation = .unknown
        self.numberOutputLabel.text = "0"
    }
    
    @IBAction func tapDotButton(_ sender: UIButton) {
        if self.displayNumber.count < 8, !self.displayNumber.contains(".") {
            self.displayNumber += self.displayNumber.isEmpty ? "0." : "."
            self.numberOutputLabel.text = self.displayNumber
        }
    }
    
    
    @IBAction func tapDividButton(_ sender: UIButton) {
        self.operation(.Divide)
    }
    
    @IBAction func tapMultiplyButton(_ sender: UIButton) {
        self.operation(.Multiply)
    }
    
    @IBAction func tapSubtractButton(_ sender: UIButton) {
        self.operation(.Subtract)
    }
    
    @IBAction func tapAddButton(_ sender: UIButton) {
        self.operation(.Add)
    }
    
    @IBAction func tapEqualbutton(_ sender: UIButton) {
        self.operation(self.currentOperation)
    }

    func operation(_ operation: Operation) {
        if self.currentOperation != .unknown {
            // 1번째 피연산자와 2번째 피연산자의 계산
            if !self.displayNumber.isEmpty {
                self.secondOperand = self.displayNumber
                self.displayNumber = ""
                
                guard let firstOperand = Double(self.firstOperand) else {
                    return
                }
                
                guard let secondOperand = Double(self.secondOperand) else {
                    return
                }
                
                // 계산 결과 값 계싼
                switch self.currentOperation {
                case .Add:
                    self.result = "\(firstOperand+secondOperand)"
                case .Subtract:
                    self.result = "\(firstOperand-secondOperand)"
                case .Divide:
                    self.result = "\(firstOperand/secondOperand)"
                case .Multiply:
                    self.result = "\(firstOperand*secondOperand)"
                default:
                    break
                }
                
                if let result = Double(self.result), result.truncatingRemainder(dividingBy: 1) == 0 {
                    self.result = "\(Int(result))"
                }
                self.firstOperand = self.result
                self.numberOutputLabel.text = self.result
            }
            
            self.currentOperation = operation
        } else {
            // 1번째 피연산자 선택한 상태
            self.firstOperand = self.displayNumber
            self.currentOperation = operation
            self.displayNumber = ""
            
        }
    }
    
}

