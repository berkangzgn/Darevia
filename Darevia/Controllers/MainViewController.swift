//
//  MainViewController.swift
//  Darevia
//
//  Created by Berkan Gezgin on 31.01.2024.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var topV: UIView!
    @IBOutlet weak var titleL: UILabel!
    @IBOutlet var menuTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setView()
    }
    
    private func setView() {
        titleL.text = "DAREVIA"
        titleL.textColor = .appWhite
        titleL.font = UIFont.boldSystemFont(ofSize: 20)
        
        menuTV.register(RoomTypeTVC.nib(), forCellReuseIdentifier: RoomTypeTVC.identifier)
        menuTV.register(RoomActivateTVC.nib(), forCellReuseIdentifier: RoomActivateTVC.identifier)
        menuTV.register(CommentsTVC.nib(), forCellReuseIdentifier: CommentsTVC.identifier)
        
        menuTV.delegate = self
        menuTV.dataSource = self
        
        view.backgroundColor = .appColor
    }
    
    @objc private func enterCodeButtonClicked() {
        // TODO: To be edited after api connection
        let alertController = UIAlertController(title: "App in developed.", message: "Room check will take place after the API connection. Therefore we redirect you to another page for now.", preferredStyle: .alert) // TODO: Lang

        let confirmAction = UIAlertAction(title: "OK", style: .default) { (_) in // TODO: Lang
            if let gameVC = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "GameVC") as? GameViewController {
                gameVC.modalPresentationStyle = .fullScreen
                self.present(gameVC, animated: true, completion: nil)
            }
        }
        
        alertController.addAction(confirmAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @objc private func playNowButtonClicked() {
        if let gameTypeVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "GameTypeViewVC") as? GameTypeViewController {
            gameTypeVC.modalPresentationStyle = .fullScreen
            present(gameTypeVC, animated: true, completion: nil)
        }
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
