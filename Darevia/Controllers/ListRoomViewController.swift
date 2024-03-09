//
//  ListRoomViewController.swift
//  Darevia
//
//  Created by Berkan Gezgin on 7.02.2024.
//

import UIKit

protocol ListConfigurable {
    func configure(with option: Int)
}

class ListRoomViewController: UIViewController, ListConfigurable {
    
    @IBOutlet weak var topV: UIView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var backBtnImg: UIImageView!
    @IBOutlet weak var titleL: UILabel!
    @IBOutlet weak var listV: UIView!
    @IBOutlet weak var listBottomV: UIView!
    @IBOutlet weak var startGameDescL: UILabel!
    @IBOutlet weak var startGameV: UIView!
    @IBOutlet weak var startGameBtn: UIButton!
    @IBOutlet weak var startGameBtnL: UILabel!
    @IBOutlet weak var playersTV: UITableView!
    @IBOutlet weak var inviteV: UIView!
    @IBOutlet weak var inviteCodeL: UILabel!
    @IBOutlet weak var inviteBtnL: UILabel!
    @IBOutlet weak var inviteBtnV: UIView!
    @IBOutlet weak var inviteBtn: UIButton!
    @IBOutlet weak var tvBottomCons: NSLayoutConstraint!
    
    var selectedOption: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setView()
        
        if let selectedOption = selectedOption  {
            configure(with: selectedOption)
        }
    }
    
    private func setView() {
        view.backgroundColor = .appColor
        
        titleL.textColor = .appWhite
        titleL.font = UIFont.boldSystemFont(ofSize: 20)
        
        backBtnImg.tintColor = .appWhite
        
        listV.backgroundColor = .appWhite
        listV.applyTopCornerRadius()
        
        playersTV.register(UserListTVC.nib(), forCellReuseIdentifier: UserListTVC.identifier)
        playersTV.delegate = self
        playersTV.dataSource = self
        
        startGameDescL.text = "Waiting for other players.".localized() 
        startGameDescL.font = UIFont.systemFont(ofSize: 13)
        
        startGameV.backgroundColor = .appColor
        startGameV.applyCornerRadius()
        
        startGameBtnL.text = "Start Game".localized()
        startGameBtnL.textColor = .appWhite
        startGameBtnL.font = UIFont.boldSystemFont(ofSize: 17)
        
        startGameBtn.setTitle("", for: .normal)
        
        inviteCodeL.textColor = .appWhite
        inviteCodeL.font = UIFont.boldSystemFont(ofSize: 15)
        
        inviteBtnL.font = .boldSystemFont(ofSize: 20)
        inviteBtnL.textColor = .appWhite
        
        inviteBtnV.backgroundColor = .appColor
        inviteBtnV.addBorder(width: 1, color: .appWhite)
        inviteBtnV.applyCornerRadius()
        
        inviteBtn.setTitle("", for: .normal)
        inviteBtn.setTitleColorExt(.appColor)
        
        switch selectedOption {
        case 1: // Waiting
            titleL.text = "DAREVIA"
            inviteBtnL.text = "INVITE".localized()
            startGameV.isHidden = false
            startGameDescL.isHidden = false
            inviteCodeL.text = "Game Code:".localized() + " \(SharedData.shared.gameRoom[0].roomID)"
            backBtnImg.isHidden = false
            backBtn.isHidden = false
            tvBottomCons.isActive = true
            
        case 2: // Result
            titleL.text = "Leader Board".localized() // TODO: Lang
            inviteBtnL.text = "CLOSE".localized()
            startGameV.isHidden = true
            startGameDescL.isHidden = true
            inviteCodeL.text = "See you again 👋".localized()
            backBtnImg.isHidden = true
            backBtn.isHidden = true
            tvBottomCons.isActive = false
            playersTV.bottomAnchor.constraint(equalTo: inviteV.topAnchor).isActive = true
            
        default:
            let alertController = UIAlertController(title: "Error".localized(), message: "We encountered an unexpected error. We will fix it and return as soon as possible.".localized(), preferredStyle: .alert)

            let confirmAction = UIAlertAction(title: "OK".localized(), style: .default) { (_) in
                self.dismiss(animated: true, completion: nil)
            }
            
            alertController.addAction(confirmAction)
            present(alertController, animated: true, completion: nil)
        }
        
    }
    
    func configure(with option: Int) {
        switch option {
        case 1: // Waiting
            selectedOption = 1
            
        case 2: // Result
            selectedOption = 2
            
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
    
    @IBAction func startGameClicked(_ sender: Any) {
        if let gameVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "GameVC") as? GameViewController {
            gameVC.modalPresentationStyle = .fullScreen
            present(gameVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func inviteBtnClicked(_ sender: UIButton) {
        switch selectedOption {
        case 1: // Waiting
            let shareText = "Why don't we see you among us?".localized()
            let shareURL = URL(string: "https://www.example.com")

            let activityViewController = UIActivityViewController(activityItems: [shareText, shareURL as Any], applicationActivities: nil)

            present(activityViewController, animated: true, completion: nil)
            
        case 2: // Result
            SharedData.shared.game.roomUsers.removeLast()
            SharedData.shared.arrayNo = 0
            
            
            for index in 0..<SharedData.shared.game.roomUsers.count {
                SharedData.shared.gameRoomUsers[index].score = 0
            }

            
            if let mainVC = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "MainVC") as? MainViewController {
                mainVC.modalPresentationStyle = .fullScreen
                present(mainVC, animated: true, completion: nil)
            }
            
        default:
            let alertController = UIAlertController(title: "Error".localized(), message: "We encountered an unexpected error. We will fix it and return as soon as possible.".localized(), preferredStyle: .alert)

            let confirmAction = UIAlertAction(title: "OK".localized(), style: .default) { (_) in
                self.dismiss(animated: true, completion: nil)
            }
            
            alertController.addAction(confirmAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func backBtnClicked(_ sender: Any) {
        let alertController = UIAlertController(title: "Delete Game".localized(), message: "Are you sure?".localized(), preferredStyle: .alert) 

        let confirmAction = UIAlertAction(title: "Yes".localized(), style: .default) { (_) in 
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(confirmAction)

        let cancelAction = UIAlertAction(title: "No".localized(), style: .cancel) 
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }
}

extension ListRoomViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SharedData.shared.game.roomUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = playersTV.dequeueReusableCell(withIdentifier: UserListTVC.identifier, for: indexPath) as! UserListTVC
        cell.userNameL.text = SharedData.shared.game.roomUsers[indexPath.row].userName
        cell.scoreL.text = "\(SharedData.shared.game.roomUsers[indexPath.row].score) point".localized() + " 🥳"
        cell.userImgV.image = UIImage(named: "\(SharedData.shared.game.roomUsers[indexPath.row].userID).png")
        return cell
    }
}
