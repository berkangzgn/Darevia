//
//  GamesCVC.swift
//  Darevia
//
//  Created by Berkan Gezgin on 4.02.2024.
//

import UIKit

class GamesCVC: UICollectionViewCell {
  
    @IBOutlet weak var gameColoredV: UIView!
    @IBOutlet weak var gameNameL: UILabel!
    @IBOutlet weak var gameImg: UIImageView!
    @IBOutlet weak var gameDetailL: UILabel!
    
    static let  identifier = "GamesCVC"
    static func nib() -> UINib { return UINib(nibName: "GamesCVC", bundle: nil) }
  
    override func awakeFromNib() {
        super.awakeFromNib()
        
        gameNameL.textColor = .appWhite
        gameNameL.font = UIFont.boldSystemFont(ofSize: 16)
        gameDetailL.textColor = .appWhite
        gameDetailL.font = .systemFont(ofSize: 14)
        gameImg.tintColor = .appWhite
        gameColoredV.applySoftCornerRadius()
    }

    public func configure(with model: GameType) {
        self.gameNameL.text = model.gameTypeName
        self.gameColoredV.backgroundColor = model.gameRoomColor
        self.gameDetailL.text = model.gameDetail
    }
    
}
