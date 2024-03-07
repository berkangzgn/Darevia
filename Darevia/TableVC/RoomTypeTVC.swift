//
//  RoomTypeTVC.swift
//  Darevia
//
//  Created by Berkan Gezgin on 31.01.2024.
//

import UIKit

protocol RoomTypeDelegate: AnyObject {
    func didSelectGameDetail(gameTypeID: Int)
}

class RoomTypeTVC: UITableViewCell {

    @IBOutlet weak var cellTitleL: UILabel!
    @IBOutlet var roomTypeCV: UICollectionView!
    @IBOutlet weak var cellV: UIView!
    
    weak var delegate: RoomTypeDelegate?
    static let  identifier = "RoomTypeTVC"
    static func nib() -> UINib { return UINib(nibName: "RoomTypeTVC", bundle: nil) }
    var gameType = [GameType]()
    
    func configure(with gameType: [GameType] ) {
        self.gameType = gameType
        roomTypeCV.reloadData()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellTitleL.text = "Games".localized() // TODO: Lang
        cellTitleL.textColor = .appColor
        cellTitleL.font = UIFont.boldSystemFont(ofSize: 16)
        roomTypeCV.register(RoomTypeCVC.nib(), forCellWithReuseIdentifier: RoomTypeCVC.identifier)
        roomTypeCV.delegate = self
        roomTypeCV.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension RoomTypeTVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameType.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = roomTypeCV.dequeueReusableCell(withReuseIdentifier: RoomTypeCVC.identifier, for: indexPath) as! RoomTypeCVC
        cell.configure(with: gameType[indexPath.row])
        cell.applySoftCornerRadius()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectGameDetail(gameTypeID: indexPath.row)
    }
    
}
