//
//  RoomTypeTVC.swift
//  Darevia
//
//  Created by Berkan Gezgin on 31.01.2024.
//

import UIKit

class RoomTypeTVC: UITableViewCell {

    @IBOutlet var roomTypeCV: UICollectionView!
    @IBOutlet weak var cellV: UIView!
    
    static let  identifier = "RoomTypeTVC"
    static func nib() -> UINib { return UINib(nibName: "RoomTypeTVC", bundle: nil) }
    var gameType = [GameType]()
    
    func configure(with gameType: [GameType] ) {
        self.gameType = gameType
        roomTypeCV.reloadData()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        roomTypeCV.register(RoomTypeCVC.nib(), forCellWithReuseIdentifier: RoomTypeCVC.identifier)
        roomTypeCV.delegate = self
        roomTypeCV.dataSource = self
        
        cellV.applyTopRoundedCorner()
        cellV.backgroundColor = .appWhite
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
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
    
}
