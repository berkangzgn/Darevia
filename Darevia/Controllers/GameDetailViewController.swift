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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setTitle()
    }
    
    private func setTitle() {
        
    }
}
