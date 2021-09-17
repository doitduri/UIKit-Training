//
//  RoundButton.swift
//  Calculator
//
//  Created by 김두리 on 2021/09/17.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {

    @IBInspectable var isRound: Bool = false {
        didSet {
            if isRound {
                self.layer.cornerRadius = self.frame.height / 2
            }
        }
    }
}
