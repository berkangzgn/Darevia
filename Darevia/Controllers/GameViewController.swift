//
//  GameViewController.swift
//  Darevia
//
//  Created by Berkan Gezgin on 14.02.2024.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var titleL: UILabel!
    
    // Bang
    @IBOutlet weak var bangV: UIView!
    @IBOutlet weak var bangCardV: UIView!
    @IBOutlet weak var bangTaskL: UILabel!
    @IBOutlet weak var bangImg: UIImageView!
    @IBOutlet weak var bangDescL: UILabel!
    
    // Watch
    @IBOutlet weak var watchV: UIView!
    @IBOutlet weak var watchCardV: UIView!
    @IBOutlet weak var watchUser1Img: UIImageView!
    @IBOutlet weak var watchUser1NameL: UILabel!
    @IBOutlet weak var watchUser2Img: UIImageView!
    @IBOutlet weak var watchUser2NameL: UILabel!
    @IBOutlet weak var watchVSL: UILabel!
    @IBOutlet weak var watchDescL: UILabel!
    
    // Assign
    @IBOutlet weak var assignV: UIView!
    @IBOutlet weak var assignVSV: UIView!
    @IBOutlet weak var vsuser1Img: UIImageView!
    @IBOutlet weak var vsuser2Img: UIImageView!
    @IBOutlet weak var vsuser1NameL: UILabel!
    @IBOutlet weak var vsuser2NameL: UILabel!
    @IBOutlet weak var vsL: UILabel!
    @IBOutlet weak var assignCardV: UIView!
    @IBOutlet weak var assignL: UILabel!
    @IBOutlet weak var assignBtnV: UIView!
    @IBOutlet weak var approveBtnV: UIView!
    @IBOutlet weak var approveL: UILabel!
    @IBOutlet weak var approvalBtn: UIButton!
    @IBOutlet weak var rejectBtnV: UIView!
    @IBOutlet weak var rejectL: UILabel!
    @IBOutlet weak var rejectBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setView()
    }
    
    private func setView() {
        view.backgroundColor = .appColor
        
        titleL.text = "DAREVIA"
        titleL.textColor = .appWhite
        titleL.font = .boldSystemFont(ofSize: 20)
        
        // Bang view
        bangV.backgroundColor = .appWhite
        bangV.applyTopCornerRadius()
        bangTaskL.textColor = .appDark
        bangTaskL.font = .boldSystemFont(ofSize: 18)
        bangDescL.textColor = .appDark
        bangDescL.font = .boldSystemFont(ofSize: 15)
        bangDescL.text =  "Give a task NOW!".localized()
        
        // Watch view
        watchV.backgroundColor = .appWhite
        watchV.applyTopCornerRadius()
        watchUser1NameL.textColor = .appDark
        watchUser1NameL.font = .boldSystemFont(ofSize: 20)
        watchUser2NameL.textColor = .appDark
        watchUser2NameL.font = .boldSystemFont(ofSize: 20)
        watchVSL.textColor = .appDark
        watchVSL.font = .boldSystemFont(ofSize: 17)
        watchVSL.text = "vs"
        watchDescL.textColor = .appDark
        watchDescL.font = .boldSystemFont(ofSize: 17)
        
        
        // Assign view
        assignV.backgroundColor = .appWhite
        assignV.applyTopCornerRadius()
        vsuser1NameL.textColor = .appDark
        vsuser1NameL.font = .boldSystemFont(ofSize: 15)
        vsuser2NameL.textColor = .appDark
        vsuser2NameL.font = .boldSystemFont(ofSize: 15)
        vsL.textColor = .appDark
        vsL.font = .systemFont(ofSize: 17)
        vsL.text = "vs"
        assignCardV.backgroundColor = .appColor
        assignCardV.applySoftCornerRadius()
        assignL.textColor = .appWhite
        assignL.font = .boldSystemFont(ofSize: 17)
        approveBtnV.backgroundColor = .appColor
        approveBtnV.addBorder(width: 1, color: .appWhite)
        approveBtnV.applyCornerRadius()
        approveL.text = "Done".localized() 
        approveL.textColor =  .appWhite
        approveL.font = UIFont.boldSystemFont(ofSize: 20)
        rejectBtnV.backgroundColor = .appColor
        rejectBtnV.addBorder(width: 1, color: .appWhite)
        rejectBtnV.applyCornerRadius()
        rejectL.text = "Fail".localized() 
        rejectL.textColor =  .appWhite
        rejectL.font = .systemFont(ofSize: 20)
        
        // Adjusting viewcontrols according to position in the game
        switch SharedData.shared.game.gameArray[SharedData.shared.arrayNo].missionType {
        case 1: // Bang time
            bangV.isHidden = false
            watchV.isHidden = true
            assignV.isHidden = true
            
            bangTaskL.text = "Challenging".localized() + " \(SharedData.shared.game.roomUsers[SharedData.shared.game.gameArray[SharedData.shared.arrayNo].user2No - 1].userName)"
            bangImg.image = UIImage(named: "\(SharedData.shared.game.roomUsers[SharedData.shared.game.gameArray[SharedData.shared.arrayNo].user1No - 1].userID).png")
            
            let waitTime = DispatchTime.now() + .seconds(4)
            DispatchQueue.main.asyncAfter(deadline: waitTime) {
                SharedData.shared.game.roomUsers[SharedData.shared.game.gameArray[SharedData.shared.arrayNo].user2No - 1].score += SharedData.shared.game.gameType.points[SharedData.shared.arrayNo]
                self.checkGame()
            }
            
        case 2: // Watch Time
            watchV.isHidden = false
            assignV.isHidden = true
            bangV.isHidden = true
        
            watchUser1Img.image = UIImage(named: "\(SharedData.shared.game.roomUsers[SharedData.shared.game.gameArray[SharedData.shared.arrayNo].user1No - 1].userID).png")
            watchUser2Img.image = UIImage(named: "\(SharedData.shared.game.roomUsers[SharedData.shared.game.gameArray[SharedData.shared.arrayNo].user2No - 1].userID).png")
            watchUser1NameL.text = "\(SharedData.shared.game.roomUsers[SharedData.shared.game.gameArray[SharedData.shared.arrayNo].user1No - 1].userName)"
            watchUser2NameL.text = "\(SharedData.shared.game.roomUsers[SharedData.shared.game.gameArray[SharedData.shared.arrayNo].user2No - 1].userName)"
            watchDescL.text = "\(SharedData.shared.game.roomUsers[SharedData.shared.game.gameArray[SharedData.shared.arrayNo].user1No - 1].userName) " + "asks".localized() + " \(SharedData.shared.game.roomUsers[SharedData.shared.game.gameArray[SharedData.shared.arrayNo].user2No - 1].userName)"
            
            let waitTime = DispatchTime.now() + .seconds(4)
            DispatchQueue.main.asyncAfter(deadline: waitTime) {
                SharedData.shared.game.roomUsers[SharedData.shared.game.gameArray[SharedData.shared.arrayNo].user2No - 1].score += SharedData.shared.game.gameType.points[SharedData.shared.arrayNo]
                self.checkGame()
            }
            
        case 3: // Assign time
            bangV.isHidden = true
            watchV.isHidden = true
            assignV.isHidden = false
        
            vsuser1Img.image = UIImage(named: "\(SharedData.shared.game.roomUsers[SharedData.shared.game.gameArray[SharedData.shared.arrayNo].user1No - 1].userID).png")
            vsuser2Img.image = UIImage(named: "\(SharedData.shared.game.roomUsers[SharedData.shared.game.gameArray[SharedData.shared.arrayNo].user2No - 1].userID).png")
            vsuser1NameL.text = "\(SharedData.shared.game.roomUsers[SharedData.shared.game.gameArray[SharedData.shared.arrayNo].user1No - 1].userName)"
            vsuser2NameL.text = "\(SharedData.shared.game.roomUsers[SharedData.shared.game.gameArray[SharedData.shared.arrayNo].user2No - 1].userName)"
            assignL.text = "\(SharedData.shared.game.gameType.questions[SharedData.shared.arrayNo])"
            
        default:
            showAlertBeforeReturnBack(title: "Error", message: "We encountered an unexpected error. We will fix it and return as soon as possible.")
        }
    }
    
    // Adjusting viewcontrols according to position in the game 
    private func checkGame() {
        SharedData.shared.arrayNo += 1
        
        if SharedData.shared.arrayNo == SharedData.shared.mission.count {
            if let listRoomVC = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "ListRoomVC") as? ListRoomViewController {
                listRoomVC.modalPresentationStyle = .fullScreen
                listRoomVC.configure(with: 2)
                present(listRoomVC, animated: true, completion: nil)
            }
        } else {
            viewDidLoad()
        }
        
    }
    
    @IBAction func approvalBtnClicked(_ sender: Any) {
        SharedData.shared.game.roomUsers[SharedData.shared.game.gameArray[SharedData.shared.arrayNo].user2No - 1].score += SharedData.shared.game.gameType.points[SharedData.shared.arrayNo]
        checkGame()
    }
    
    @IBAction func rejectBtnClicked(_ sender: Any) {
        checkGame()
    }
}
