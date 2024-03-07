//
//  WaitingRoomViewController.swift
//  Darevia
//
//  Created by Berkan Gezgin on 7.02.2024.
//

import UIKit

class WaitingRoomViewController: UIViewController {

    @IBOutlet weak var topV: UIView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var backBtnImg: UIImageView!
    @IBOutlet weak var titleL: UILabel!
    @IBOutlet weak var listV: UIView!
    @IBOutlet weak var listBottomV: UIView!
    @IBOutlet weak var startGameDescL: UILabel!
    @IBOutlet weak var startGameV: UIView!
    @IBOutlet weak var startGameBtn: UIButton!
    @IBOutlet weak var playersTV: UITableView!
    @IBOutlet weak var inviteV: UIView!
    @IBOutlet weak var inviteCodeL: UILabel!
    @IBOutlet weak var inviteBtnV: UIView!
    @IBOutlet weak var inviteBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setView()
    }
    
    private func setView() {
        titleL.text = "DAREVIA"
        titleL.textColor = .appWhite
        titleL.font = UIFont.boldSystemFont(ofSize: 20)
        
        backBtnImg.tintColor = .appWhite
        
        view.backgroundColor = .appColor
        listV.backgroundColor = .appWhite
        listV.applyTopCornerRadius()
        
        playersTV.register(UserListTVC.nib(), forCellReuseIdentifier: UserListTVC.identifier)
        playersTV.delegate = self
        playersTV.dataSource = self
        
        startGameDescL.text = "Waiting for other players.".localized() // TODO: Lang
        startGameDescL.font = UIFont.systemFont(ofSize: 13)
        
        startGameV.backgroundColor = .appColor
        startGameV.applyCornerRadius()
        
        startGameBtn.setTitle("Start Game".localized(), for: .normal) // TODO: Lang
        startGameBtn.setTitleColorExt(.appWhite)
        startGameBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        inviteCodeL.text = "Game Code: \(SharedData.shared.gameRoom[0].roomID)".localized() // TODO: Lang
        inviteCodeL.textColor = .appWhite
        inviteCodeL.font = UIFont.boldSystemFont(ofSize: 15)
        
        inviteBtnV.backgroundColor = .appWhite
        inviteBtnV.applyCornerRadius()
        inviteBtn.setTitleColorExt(.appColor)
        inviteBtn.setTitle("INVITE".localized(), for: .normal) // TODO: Lang
        inviteBtn.titleLabel?.font = .boldSystemFont(ofSize: 20)
    }
    
    @IBAction func startGameClicked(_ sender: Any) {
        // TODO: API connection to be added
        if let gameVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "GameVC") as? GameViewController {
            gameVC.modalPresentationStyle = .fullScreen
            present(gameVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func inviteBtnClicked(_ sender: UIButton) {
        let shareText = "Why don't we see you among us?".localized() // TODO: Lang
        let shareURL = URL(string: "https://www.example.com")

        let activityViewController = UIActivityViewController(activityItems: [shareText, shareURL as Any], applicationActivities: nil)

        present(activityViewController, animated: true, completion: nil)
    }
    
    @IBAction func backBtnClicked(_ sender: Any) {
        let alertController = UIAlertController(title: "Delete Game".localized(), message: "Are you sure?".localized(), preferredStyle: .alert) // TODO: Lang

        let confirmAction = UIAlertAction(title: "Yes".localized(), style: .default) { (_) in // TODO: Lang
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(confirmAction)

        let cancelAction = UIAlertAction(title: "No".localized(), style: .cancel) // TODO: Lang
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }
}

extension WaitingRoomViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SharedData.shared.gameRoomUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = playersTV.dequeueReusableCell(withIdentifier: UserListTVC.identifier, for: indexPath) as! UserListTVC
        cell.userNameL.text = SharedData.shared.gameRoomUsers[indexPath.row].userName
        cell.scoreL.text = "\(SharedData.shared.gameRoomUsers[indexPath.row].score) point 🥳".localized() // TODO: Lang
        return cell
    }
}
