//
//  CardListViewController.swift
//  CreditCardList
//
//  Created by 김두리 on 2021/09/21.
//

import UIKit
import Kingfisher
import FirebaseDatabase

class CardListViewController: UITableViewController {
    // table view를 연결하는데 필요한 delegate, sourece를 기본으로 설정해줌
    
    var ref: DatabaseReference! // Firebase Realtime Database
    
    var creditCardList: [CreditCard] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UITableView Cell Register
        let nibName = UINib(nibName: "CardListCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "CardListCell")
        
        ref = Database.database().reference()
        
        // ref에서 값을 지켜보고 있다가, 값을 snapshot 객체로 전달
        // value => database type 지정
        ref.observe(.value) { snapshot in
            guard let value = snapshot.value as? [String: [String: Any]] else { return
            }
            
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: value)
                let cardData = try JSONDecoder().decode([String: CreditCard].self, from: jsonData)
                
                let cardList = Array(cardData.values)
                self.creditCardList = cardList.sorted {$0.rank < $1.rank}
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                // UI를 설정하는 것임으로 메인쓰레드 환경에서
                
            } catch let error {
                print("error json parsing \(error.localizedDescription)")
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return creditCardList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CardListCell", for: indexPath) as? CardListCell else {
            return UITableViewCell()
        }
        
        cell.rankLabel.text = "\(creditCardList[indexPath.row].rank)위"
        cell.promotionLabel.text = "\(creditCardList[indexPath.row].promotionDetail.amount)만원 증정"
        cell.cardNameLabel.text = "\(creditCardList[indexPath.row].name)"
        
        
        let imageURL = URL(string: creditCardList[indexPath.row].cardImageURL)
        
        cell.cardImageView.kf.setImage(with: imageURL)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 상세 화면 전달
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        guard let detailViewController = storyboard.instantiateViewController(identifier: "CardDetailViewController") as? CardDetailViewController else {
            return
        }
        
        detailViewController.promotionDetail = creditCardList[indexPath.row].promotionDetail
        self.show(detailViewController, sender: nil)
        
        let cardID = creditCardList[indexPath.row].id
//        ref.child("Item\(cardID)/isSelected").setValue(true)
        
        
        ref.queryOrdered(byChild: "id").queryEqual(toValue: cardID).observe(.value) {[weak self] snapshot in
            guard let self = self,
                  let value = snapshot.value as? [String: [String: Any]],
                  let key = value.keys.first else  {return}
            
            self.ref.child("\(key)/isSelected").setValue(true)
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let cardID = creditCardList[indexPath.row].id
//            ref.child("Item\(cardID)").removeValue()
            
            ref.queryOrdered(byChild: "id").queryEqual(toValue: cardID).observe(.value) {[weak self]
                snapshot in
                guard let self = self,
                      let value = snapshot.value as?  [String: [String: Any]],
                      let key = value.keys.first else {return}
                
                
                self.ref.child(key).removeValue()
            }
        }
    }
}
