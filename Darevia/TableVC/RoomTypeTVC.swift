//
//  RoomTypeTVC.swift
//  Darevia
//
//  Created by Berkan Gezgin on 31.01.2024.
//

import UIKit

class RoomTypeTVC: UITableViewCell {

    static let  identifier = "RoomTypeTVC"
    static func nib() -> UINib {
        return UINib(nibName: "RoomTypeTVC", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}