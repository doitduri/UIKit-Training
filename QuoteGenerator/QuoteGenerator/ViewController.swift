//
//  ViewController.swift
//  QuoteGenerator
//
//  Created by 김두리 on 2021/09/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    let quotes = [
        Quote(contents: "세 번 참으면 호구된다", name: "박명수"),
        Quote(contents: "늦었다고 생각할 때가 정말 늦은 때다", name: "박명수"),
        Quote(contents: "노력하지 않는 자는 기회조차 안 옵니다", name: "박명수"),
        Quote(contents: "지금 공부 안하면 더울 때 더운데서 일하고 추울 때 추운데서 일한다", name: "박명수"),
        Quote(contents: "감사의 표시는 돈으로 하라", name: "박명수"),
        Quote(contents: "일찍 일어나는 새가 피곤하다", name: "박명수"),
        Quote(contents: "죽음과 결혼은 뒤로 미룰수록 좋다", name: "박명수"),
        Quote(contents: "안 되면 말고", name: "박명수"),
        Quote(contents: "원수는 회사에서 만난다", name: "박명수"),
        Quote(contents: "부모 욕 하는 건 참아도 내 욕하는 건 참을 수 없다", name: "박명수"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tabQuoteGeneratorButton(_ sender: Any) {
        let random = Int(arc4random_uniform(UInt32(quotes.count)))
        let quote = quotes[random]
        self.quoteLabel.text = quote.contents
        self.nameLabel.text = quote.name
    }
    
}

