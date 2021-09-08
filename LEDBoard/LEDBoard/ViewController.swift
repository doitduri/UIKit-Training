//
//  ViewController.swift
//  LEDBoard
//
//  Created by 김두리 on 2021/09/08.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var contentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contentLabel.textColor = .yellow
    }


}

