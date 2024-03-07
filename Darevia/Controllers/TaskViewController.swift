//
//  TaskViewController.swift
//  Darevia
//
//  Created by Berkan Gezgin on 5.03.2024.
//

import UIKit

protocol TaskConfigurable {
    func configure(with option: Int, id: Int)
}

class TaskViewController: UIViewController, TaskConfigurable {
    
    @IBOutlet weak var pointV: UIView!
    @IBOutlet weak var pointNumberL: UILabel!
    @IBOutlet weak var pointTxtL: UILabel!
    @IBOutlet weak var taskV: UIView!
    @IBOutlet weak var statuL: UILabel!
    @IBOutlet weak var statuImg: UIImageView!
    @IBOutlet weak var taskL: UILabel!
    @IBOutlet weak var bangBtnV: UIView!
    @IBOutlet weak var bangBtnL: UILabel!
    @IBOutlet weak var bangBtn: UIButton!
    
    var selectedOption: Int?
    var playerName: String?
    var playerID: Int?
    var userOption: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setView()
        
        if let selectedOption = selectedOption,
            let playerId = playerID {
            configure(with: selectedOption, id: playerId)
        }
    }
    
    private func setView() {
        view.backgroundColor = .appColor
        
        taskV.backgroundColor = .appWhite
        taskV.applyTopCornerRadius()
        
        pointV.makeViewCircular()
        pointV.backgroundColor = .appColor
        pointV.addBorder(width: 2, color: .appWhite)
        
        pointNumberL.text = "30" // TODO: Must be done with api
        pointNumberL.textColor = .appWhite
        pointNumberL.font = .boldSystemFont(ofSize: 30)
        
        pointTxtL.text = "point".localized() 
        pointTxtL.textColor = .appWhite
        pointTxtL.font = .systemFont(ofSize: 17)
        
        statuL.textColor = .appDark
        statuL.font = .boldSystemFont(ofSize: 20)
        
        statuImg.image = UIImage(named: "\(playerID ?? 3).png")
        
        taskL.textColor = .appDark
        taskL.font = .systemFont(ofSize: 15)
        
        bangBtnV.applyCornerRadius()
        bangBtn.setTitle("", for: .normal)
        bangBtnL.textColor = .appWhite
        bangBtnL.font = .boldSystemFont(ofSize: 20)
        
        switch userOption {
        case 1: // Assign time
            pointV.isHidden = true
            statuL.text = " \(playerName!) is giving you a task!".localized() // TODO: To be done with api
            taskL.text = "Put your phone away. Do your task.".localized()
            bangBtnV.isHidden = true
            bangBtn.isUserInteractionEnabled = true
        
        case 2: // Watch time
            pointV.isHidden = false
            statuL.text = ""
            taskL.text = " \(playerName!)'s Turn to Assign!".localized() // TODO: To be done with api
            bangBtnV.backgroundColor = .appBluredColor
            bangBtnV.isHidden = false
            bangBtn.isUserInteractionEnabled = false
            bangBtnL.text = " \(playerName!) is Assigning".localized() // TODO: To be done with api
        
        case 3: // Bang time
            pointV.isHidden = false
            statuL.text = "Challenging \(playerName!)".localized() // TODO: To be done with api
            taskL.text = "Give a task NOW!".localized()
            bangBtnV.backgroundColor = .appColor
            bangBtnV.isHidden = false
            bangBtn.isUserInteractionEnabled = true
            bangBtnL.text = "Bang!"
            
        default:
            let alertController = UIAlertController(title: "Error".localized(), message: "We encountered an unexpected error. We will fix it and return as soon as possible.".localized(), preferredStyle: .alert) 

            let confirmAction = UIAlertAction(title: "OK".localized(), style: .default) { (_) in
                self.dismiss(animated: true, completion: nil)
            }
            
            alertController.addAction(confirmAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    func configure(with option: Int, id: Int) {
        switch option {
        case 1: // Assign time
            userOption = 1
            playerName = SharedData.shared.gameRoomUsers[id].userName
            playerID = id
        
        case 2: // Watch time
            userOption = 2
            playerName = SharedData.shared.gameRoomUsers[id].userName
            playerID = id
        
        case 3: // Bang time
            userOption = 3
            playerName = SharedData.shared.gameRoomUsers[id].userName
            playerID = id
            
        default:
            // TODO: To be tested. Giving error
            let alertController = UIAlertController(title: "Error".localized(), message: "We encountered an unexpected error. We will fix it and return as soon as possible.".localized(), preferredStyle: .alert)

            let confirmAction = UIAlertAction(title: "OK".localized(), style: .default) { (_) in
                self.dismiss(animated: true, completion: nil)
            }
            
            alertController.addAction(confirmAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func bangBtnClicked(_ sender: Any) {
        // TODO: Will be updated with API
        print("Bang button clicked.")
    }
}
