//
//  GameViewController.swift
//  Darevia
//
//  Created by Berkan Gezgin on 14.02.2024.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var titleL: UILabel!
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
    
        titleL.text = "DAREVIA"
        titleL.textColor = .appWhite
        titleL.font = UIFont.boldSystemFont(ofSize: 20)
        
        gameCardV.backgroundColor = .appBluredColor
        gameCardV.applySoftCornerRadius()
        
        questionTV.textColor = .appDark
        questionTV.font = UIFont.boldSystemFont(ofSize: 19)
        
        approveBtnV.backgroundColor = .appBluredColor
        approveBtnV.addBorder(width: 1, color: .appWhite)
        approveBtnV.applyCornerRadius()
        
        approveL.text = "Done" // TODO: Lang
        approveL.textColor =  .appWhite
        approveL.font = UIFont.boldSystemFont(ofSize: 20)
        
        rejectBtnV.backgroundColor = .appBluredColor
        rejectBtnV.addBorder(width: 1, color: .appWhite)
        rejectBtnV.applyCornerRadius()
        
        rejectL.text = "Not now :(" // TODO: Lang
        rejectL.textColor =  .appWhite
        rejectL.font = .systemFont(ofSize: 20)
        
        if statu == 0 { // Questioner
            buttonsV.isHidden = false
            questionTV.text = "\(SharedData.shared.gameType[0].questions![0])" // TODO: Will be updated with API
            
        } else if statu == 1 { // Answerer
            buttonsV.isHidden = true
            questionTV.text = "It's your time!" // TODO: Lang
            
        } else { // Other player
            buttonsV.isHidden = true
            questionTV.text = "X asks Y!" // TODO: Will be updated with API
        }
    }
    
    @IBAction func approvalBtnClicked(_ sender: Any) {
        // TODO: Will be updated with API
        print("Approve button clicked.")
    }
    
    @IBAction func rejectBtnClicked(_ sender: Any) {
        // TODO: Will be updated with API
        print("Reject button clicked.")
    }
}
