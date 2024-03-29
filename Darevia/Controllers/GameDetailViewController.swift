//
//  GameDetailViewController.swift
//  Darevia
//
//  Created by Berkan Gezgin on 5.02.2024.
//

import UIKit

class GameDetailViewController: UIViewController {

    @IBOutlet weak var topV: UIView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var backBtnImg: UIImageView!
    @IBOutlet weak var titleL: UILabel!
    @IBOutlet weak var collectionV: UIView!
    @IBOutlet weak var detailCV: UICollectionView!
    @IBOutlet weak var detailV: UIView!
    @IBOutlet weak var detailImg: UIImageView!
    @IBOutlet weak var gameTitleL: UILabel!
    @IBOutlet weak var detailL: UILabel!
    @IBOutlet weak var detailTV: UITextView!
    @IBOutlet weak var createGameBtnL: UILabel!
    @IBOutlet weak var createGameBtnV: UIView!
    @IBOutlet weak var createGameBtn: UIButton!
    
    var gameTypeID: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setView()
    }
    
    private func setView() {
        titleL.text = "DAREVIA"
        titleL.textColor = .appDark
        titleL.font = UIFont.boldSystemFont(ofSize: 20)
        
        backBtnImg.tintColor = .appDark
        
        detailV.applyTopCornerRadius()
        detailV.backgroundColor = .appWhite
        
        detailL.text = "Game details"
        detailTV.text = SharedData.shared.gameType[gameTypeID].gameDesc
        
        collectionV.backgroundColor = SharedData.shared.gameType[gameTypeID].gameRoomColor
        
        detailCV.register(DetailCVC.nib(), forCellWithReuseIdentifier: DetailCVC.identifier)
        detailCV.delegate = self
        detailCV.dataSource = self
        
        createGameBtnV.backgroundColor = .appColor
        createGameBtnV.applyCornerRadius()
        
        createGameBtn.setTitle("", for: .normal)
        
        createGameBtnL.text = "Create Game".localized()
        createGameBtnL.font = .boldSystemFont(ofSize: 17)
        createGameBtnL.textColor = .appWhite
    }
    
    // Button funcs
    @IBAction func createGameClicked(_ sender: Any) {
        if let createUserVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "CreateUserVC") as? CreateUserViewController {
            createUserVC.modalPresentationStyle = .fullScreen
            present(createUserVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func backBtnClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension GameDetailViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = detailCV.dequeueReusableCell(withReuseIdentifier: DetailCVC.identifier, for: indexPath) as! DetailCVC
        cell.detailL.text = SharedData.shared.gameType[gameTypeID].questions[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (collectionView.bounds.width - 10 * 3) / 2
        let cellHeight: CGFloat = 205
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
