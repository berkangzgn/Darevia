//
//  GameTypeViewController.swift
//  Darevia
//
//  Created by Berkan Gezgin on 4.02.2024.
//

import UIKit

class GameTypeViewController: UIViewController {

    @IBOutlet weak var upperV: UIView!
    @IBOutlet weak var gamesCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setView()
    }
    
    private func setView() {
        view.backgroundColor = .appDark
        
        gamesCV.register(GamesCVC.nib(), forCellWithReuseIdentifier: GamesCVC.identifier)
        gamesCV.delegate = self
        gamesCV.dataSource = self
    }

}

extension GameTypeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SharedData.shared.gameType.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = gamesCV.dequeueReusableCell(withReuseIdentifier: GamesCVC.identifier, for: indexPath) as! GamesCVC
        cell.configure(with: SharedData.shared.gameType[indexPath.row])
        cell.applyCornerRadius()
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 150, height: 205)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (collectionView.bounds.width - 10 * 3) / 2
        let cellHeight: CGFloat = 205
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
