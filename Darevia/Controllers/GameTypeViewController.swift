//
//  GameTypeViewController.swift
//  Darevia
//
//  Created by Berkan Gezgin on 4.02.2024.
//

import UIKit

class GameTypeViewController: UIViewController {

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var backBtnImg: UIImageView!
    @IBOutlet weak var titleL: UILabel!
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

    @IBAction func backBtnClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension GameTypeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SharedData.shared.gameType.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = gamesCV.dequeueReusableCell(withReuseIdentifier: GamesCVC.identifier, for: indexPath) as! GamesCVC
        cell.configure(with: SharedData.shared.gameType[indexPath.row])
        return cell
    }
    
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let gameDetailVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "GameDetailVC") as? GameDetailViewController {
            gameDetailVC.gameTypeID = indexPath.row
            gameDetailVC.modalPresentationStyle = .fullScreen
            present(gameDetailVC, animated: true, completion: nil)
        }
    }
}
