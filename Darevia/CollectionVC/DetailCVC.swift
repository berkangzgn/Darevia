//
//  DetailCVC.swift
//  Darevia
//
//  Created by Berkan Gezgin on 5.02.2024.
//

import UIKit

class DetailCVC: UICollectionViewCell {
    
    @IBOutlet weak var cellBGV: UIView!
    @IBOutlet weak var detailL: UILabel!
    
    static let  identifier = "DetailCVC"
    static func nib() -> UINib { return UINib(nibName: "DetailCVC", bundle: nil) }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellBGV.backgroundColor = .appWhite
        cellBGV.applySoftCornerRadius()
    }
}
