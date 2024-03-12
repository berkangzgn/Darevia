//
//  CommentCVC.swift
//  Darevia
//
//  Created by Berkan Gezgin on 2.02.2024.
//

import UIKit

class CommentCVC: UICollectionViewCell {
    
    @IBOutlet var commentV: UIView!
    @IBOutlet var userImg: UIImageView!
    @IBOutlet var userName: UILabel!
    @IBOutlet var comment: UILabel!
    
    static let  identifier = "CommentCVC"
    static func nib() -> UINib { return UINib(nibName: "CommentCVC", bundle: nil) }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        userName.textColor = .appWhite
        userName.font = .systemFont(ofSize: 17)
        comment.textColor = .appWhite
        comment.font = .systemFont(ofSize: 12)
    }
    
    public func configure(with model: Comments) {
        self.userName.text = model.commenterUser
        self.comment.text = model.commentText
        self.userImg.tintColor = .appColor
        self.userImg.image = UIImage(named: "\(model.commentID).png")
    }

}
