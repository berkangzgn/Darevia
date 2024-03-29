//
//  MainViewController.swift
//  Darevia
//
//  Created by Berkan Gezgin on 31.01.2024.
//

import UIKit 

class MainViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var topV: UIView!
    @IBOutlet weak var titleL: UILabel!
    @IBOutlet var menuTV: UITableView!
    
    var gameRoomCode = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setView()
    }
    
    private func setView() {
        titleL.text = "DAREVIA"
        titleL.textColor = .appColor
        titleL.font = UIFont.boldSystemFont(ofSize: 20)
        
        menuTV.register(RoomActivateTVC.nib(), forCellReuseIdentifier: RoomActivateTVC.identifier)
        menuTV.register(RoomTypeTVC.nib(), forCellReuseIdentifier: RoomTypeTVC.identifier)
        menuTV.register(CommentsTVC.nib(), forCellReuseIdentifier: CommentsTVC.identifier)
        
        menuTV.delegate = self
        menuTV.dataSource = self
        
        view.backgroundColor = .appWhite
    }
    
    // Button funcs
    @objc private func enterCodeButtonClicked() {
        let cell = menuTV.dequeueReusableCell(withIdentifier: RoomActivateTVC.identifier) as! RoomActivateTVC
        if cell.enterCodeTF.text!.count < 6 {
            showAlert(title: "Error", message: "Please enter 6 digit code.")
        } else {
            // MARK: Delete this warning, modify this function after the API connection.
            showAlert(title: "App in development.", message: "Room check'll take place after the API connection. Therefore we redirect you to another page for now.")
        }
    }
    
    @objc private func playNowButtonClicked() {
        if let gameTypeVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "GameTypeViewVC") as? GameTypeViewController {
            gameTypeVC.modalPresentationStyle = .fullScreen
            present(gameTypeVC, animated: true, completion: nil)
        }
    }
    
    // After entering 6 characters, automatic orientation function
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if ((textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? "").count == 6 {
                // MARK: Delete this warning, modify this function after the API connection.
            showAlert(title: "App in development.", message: "Room check'll take place after the API connection. Therefore we redirect you to another page for now.")
        }

        return true
    }
}
 
extension MainViewController: UITableViewDelegate, UITableViewDataSource, RoomTypeDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = menuTV.dequeueReusableCell(withIdentifier: RoomActivateTVC.identifier, for: indexPath) as! RoomActivateTVC
            
            cell.playNowBtn.addTarget(self, action: #selector(playNowButtonClicked), for: .touchUpInside)
            cell.enterGameBtn.addTarget(self, action: #selector(enterCodeButtonClicked), for: .touchUpInside)
            cell.enterCodeTF.delegate = self
            return cell
            
        } else if indexPath.row == 1 {
            let cell = menuTV.dequeueReusableCell(withIdentifier: RoomTypeTVC.identifier, for: indexPath) as! RoomTypeTVC
            cell.configure(with: SharedData.shared.gameType)
            cell.delegate = self
            return cell
            
        } else {
            let cell = menuTV.dequeueReusableCell(withIdentifier: CommentsTVC.identifier, for: indexPath) as! CommentsTVC
            cell.configure(with: SharedData.shared.comments)
            return cell
            
        }
    }

    func didSelectGameDetail(gameTypeID: Int) {
        let gameDetailVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "GameDetailVC") as! GameDetailViewController
        gameDetailVC.gameTypeID = gameTypeID
        gameDetailVC.modalPresentationStyle = .fullScreen
        present(gameDetailVC, animated: true, completion: nil)
    }
}
