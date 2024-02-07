//
//  UserListTVC.swift
//  Darevia
//
//  Created by Berkan Gezgin on 7.02.2024.
//

import UIKit

class UserListTVC: UITableViewCell {

    static let  identifier = "UserListTVC"
    static func nib() -> UINib { return UINib(nibName: "UserListTVC", bundle: nil) }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setView() {
        
    }
    
}
