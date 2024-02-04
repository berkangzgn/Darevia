//
//  ViewController.swift
//  Darevia
//
//  Created by Berkan Gezgin on 31.01.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var menuTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setView()
    }
    
    private func setView() {
        menuTV.register(RoomTypeTVC.nib(), forCellReuseIdentifier: RoomTypeTVC.identifier)
        menuTV.register(RoomActivateTVC.nib(), forCellReuseIdentifier: RoomActivateTVC.identifier)
        menuTV.register(CommentsTVC.nib(), forCellReuseIdentifier: CommentsTVC.identifier)
        
        menuTV.delegate = self
        menuTV.dataSource = self
        
        view.backgroundColor = .appColor
    }
    
    @objc private func enterCodeButtonClicked() {
        print("Enter Game button tapped in ViewController")
    }
    
    @objc private func playNowButtonClicked() {
        print("Play Now button tapped in ViewController")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
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
            return cell
            
        } else {
            let cell = menuTV.dequeueReusableCell(withIdentifier: CommentsTVC.identifier, for: indexPath) as! CommentsTVC
            cell.configure(with: SharedData.shared.comments)
            return cell
            
        }
    }
}
