//
//  CommentsTVC.swift
//  Darevia
//
//  Created by Berkan Gezgin on 2.02.2024.
//

import UIKit

class CommentsTVC: UITableViewCell {

    @IBOutlet weak var cellTitleL: UILabel!
    @IBOutlet var commentCV: UICollectionView!
    @IBOutlet weak var cellV: UIView!
    
    var comments = [Comments]()
    
    static let  identifier = "CommentsTVC"
    static func nib() -> UINib { return UINib(nibName: "CommentsTVC", bundle: nil) }
    
    func configure(with comments: [Comments] ) {
        self.comments = comments
        commentCV.reloadData()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellTitleL.text = "example title"
        commentCV.register(CommentCVC.nib(), forCellWithReuseIdentifier: CommentCVC.identifier)
        commentCV.delegate = self
        commentCV.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension CommentsTVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return comments.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = commentCV.dequeueReusableCell(withReuseIdentifier: CommentCVC.identifier, for: indexPath) as! CommentCVC
        cell.configure(with: comments[indexPath.row])
        cell.applyCornerRadius()
        cell.backgroundColor = .appWhite
        return cell
    }
    
    
}
