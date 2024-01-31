//
//  RoomTypeTVC.swift
//  Darevia
//
//  Created by Berkan Gezgin on 31.01.2024.
//

import UIKit

class RoomTypeTVC: UITableViewCell {

    @IBOutlet var roomTypeCV: UICollectionView!
    
    static let  identifier = "RoomTypeTVC"
    static func nib() -> UINib { return UINib(nibName: "RoomTypeTVC", bundle: nil) }
    var roomTypeMenu = [RoomTypeModel]()
    
    func configure(with roomTypeMenu: [RoomTypeModel] ) {
        self.roomTypeMenu = roomTypeMenu
        roomTypeCV.reloadData()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        roomTypeCV.showsVerticalScrollIndicator = false
//        roomTypeCV.showsHorizontalScrollIndicator = false
        
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
        return roomTypeMenu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = roomTypeCV.dequeueReusableCell(withReuseIdentifier: RoomTypeCVC.identifier, for: indexPath) as! RoomTypeCVC
        cell.configure(with: roomTypeMenu[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
    
}
