//
//  RoomTypeCVC.swift
//  Darevia
//
//  Created by Berkan Gezgin on 31.01.2024.
//

import UIKit

class RoomTypeCVC: UICollectionViewCell {

    @IBOutlet var roomTypeL: UILabel!
    @IBOutlet var roomTypeImg: UIImageView!
    @IBOutlet var roomTypeBGV: UIView!
    
    static let  identifier = "RoomTypeCVC"
    static func nib() -> UINib { return UINib(nibName: "RoomTypeCVC", bundle: nil) }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(with model: GameType) {
        self.roomTypeL.text = model.gameTypeName
        self.roomTypeL.textColor = .appWhite
        self.roomTypeBGV.backgroundColor = model.gameRoomColor
        self.roomTypeBGV.applySoftCornerRadius()
        self.roomTypeImg.tintColor = .appWhite
    }

}
