//
//  GameDetailViewController.swift
//  Darevia
//
//  Created by Berkan Gezgin on 5.02.2024.
//

import UIKit

class GameDetailViewController: UIViewController {

    @IBOutlet weak var topV: UIView!
    @IBOutlet weak var collectionV: UIView!
    @IBOutlet weak var detailCV: UICollectionView!
    @IBOutlet weak var detailV: UIView!
    @IBOutlet weak var detailImg: UIImageView!
    @IBOutlet weak var titleL: UILabel!
    @IBOutlet weak var detailL: UILabel!
    @IBOutlet weak var detailTV: UITextView!
    
    var gameTypeID: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setView()
    }
    
    private func setView() {
        detailV.applyTopCornerRadius()
        detailV.backgroundColor = .appWhite
        
        titleL.text = SharedData.shared.gameType[gameTypeID].gameTypeName
        detailL.text = "asd aasdasd asdad"
//        detailTV.text = SharedData.shared.gameType[gameTypeID].gameDesc // TODO: gameDesc eklenecek
        
        collectionV.backgroundColor = SharedData.shared.gameType[gameTypeID].gameRoomColor
        
        detailCV.register(DetailCVC.nib(), forCellWithReuseIdentifier: DetailCVC.identifier)
        detailCV.delegate = self
        detailCV.dataSource = self
    }
}

extension GameDetailViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = detailCV.dequeueReusableCell(withReuseIdentifier: DetailCVC.identifier, for: indexPath) as! DetailCVC
        cell.detailL.text = SharedData.shared.gameType[gameTypeID].questions![indexPath.row]
        return cell
    }
}
