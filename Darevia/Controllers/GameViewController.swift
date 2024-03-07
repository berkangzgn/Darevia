//
//  GameViewController.swift
//  Darevia
//
//  Created by Berkan Gezgin on 14.02.2024.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var vsL: UILabel!
    @IBOutlet weak var user1Img: UIImageView!
    @IBOutlet weak var user1L: UILabel!
    @IBOutlet weak var user2L: UILabel!
    @IBOutlet weak var user2Img: UIImageView!
    @IBOutlet weak var gameCardV: UIView!
    @IBOutlet weak var questionTV: UITextView!
    @IBOutlet weak var buttonsV: UIView!
    @IBOutlet weak var approveBtnV: UIView!
    @IBOutlet weak var approveL: UILabel!
    @IBOutlet weak var approvalBtn: UIButton!
    @IBOutlet weak var rejectBtnV: UIView!
    @IBOutlet weak var rejectL: UILabel!
    @IBOutlet weak var rejectBtn: UIButton!
    
    var statu: Int = 0 // MARK: API will change the statu (0 - Questioner, 1- Answerer, 2 - Other)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setView()
    }
    
    private func setView() {
        view.backgroundColor = .appColor
    
        vsL.text = "VS"
        vsL.textColor = .appWhite
        vsL.font = .boldSystemFont(ofSize: 15)
        
        user1L.text = "user1"
        user1L.textColor = .appWhite
        user1L.font = .systemFont(ofSize: 15)
        user1Img.image = UIImage(named: "1.png")
        
        user2L.text = "user2"
        user2L.textColor = .appWhite
        user2L.font = .systemFont(ofSize: 15)
        user2Img.image = UIImage(named: "2.png")
        
        gameCardV.backgroundColor = .appBluredColor
        gameCardV.applySoftCornerRadius()
        
        
        questionTV.textColor = .appDark
        questionTV.font = UIFont.boldSystemFont(ofSize: 19)
        
        approveBtnV.backgroundColor = .appBluredColor
        approveBtnV.addBorder(width: 1, color: .appWhite)
        approveBtnV.applyCornerRadius()
        
        approveL.text = "Done".localized() 
        approveL.textColor =  .appWhite
        approveL.font = UIFont.boldSystemFont(ofSize: 20)
        
        rejectBtnV.backgroundColor = .appBluredColor
        rejectBtnV.addBorder(width: 1, color: .appWhite)
        rejectBtnV.applyCornerRadius()
        
        rejectL.text = "Fail".localized() 
        rejectL.textColor =  .appWhite
        rejectL.font = .systemFont(ofSize: 20)
        
        if statu == 0 { // Questioner
            buttonsV.isHidden = false
            questionTV.text = "\(SharedData.shared.gameType[0].questions![0])" // TODO: Will be updated with API
            
        } else if statu == 1 { // Answerer
            buttonsV.isHidden = true
            questionTV.text = "It's your time!".localized() 
            
        } else { // Other player
            buttonsV.isHidden = true
            questionTV.text = "X asks Y!".localized() // TODO: Will be updated with API
        }
    }
    
    @IBAction func approvalBtnClicked(_ sender: Any) {
        // TODO: Will be updated with API
        print("Approve button clicked.")
    }
    
    @IBAction func rejectBtnClicked(_ sender: Any) {
        // TODO: Will be updated with API
        print("Reject button clicked.")
        if let taskVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "TaskVC") as? TaskViewController {
            taskVC.modalPresentationStyle = .fullScreen
            taskVC.configure(with: 3, id: 2) // TODO: Must be done with api
            present(taskVC, animated: true, completion: nil)
        }
    }
}
