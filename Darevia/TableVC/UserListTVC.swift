//
//  UserListTVC.swift
//  Darevia
//
//  Created by Berkan Gezgin on 7.02.2024.
//

import UIKit

class UserListTVC: UITableViewCell {

    @IBOutlet weak var userImgV: UIImageView!
    @IBOutlet weak var userNameL: UILabel!
    @IBOutlet weak var scoreL: UILabel!
    
    static let  identifier = "UserListTVC"
    static func nib() -> UINib { return UINib(nibName: "UserListTVC", bundle: nil) }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setView()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.setView()
    }
    
    private func setView() {
        userImgV.makeCircular()
        
    }
    
}
