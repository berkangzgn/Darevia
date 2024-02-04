//
//  RoomActivateTVC.swift
//  Darevia
//
//  Created by Berkan Gezgin on 2.02.2024.
//

import UIKit

class RoomActivateTVC: UITableViewCell {

    @IBOutlet weak var cellV: UIView!
    
    @IBOutlet weak var playNowV: UIView!
    @IBOutlet weak var playNowImg: UIImageView!
    @IBOutlet weak var playNowL: UILabel!
    @IBOutlet weak var playNowBtn: UIButton!
    
    @IBOutlet weak var enterGameBtn: UIButton!
    @IBOutlet weak var enterGameImg: UIImageView!
    @IBOutlet weak var enterCodeV: UIView!
    @IBOutlet weak var enterCodeTF: UITextField!
    
    static let  identifier = "RoomActivateTVC"
    static func nib() -> UINib { return UINib(nibName: "RoomActivateTVC", bundle: nil) }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setView()
        enterCodeTF.addDoneButtonToKeyboard(target: self, action: #selector(doneButtonTapped))
    }

    private func setView() {
        cellV.backgroundColor = .appBluredColor
        cellV.applyCornerRadius()
        
        playNowImg.tintColor = .appColor
        
        playNowV.applyCornerRadius()
        playNowV.backgroundColor = .appWhite
        
        playNowL.text = "Play Now"
        playNowL.textColor = .appColor
        
        enterCodeV.applyCornerRadius()
        enterCodeV.backgroundColor = .appColor
        enterCodeV.addBorder(width: 2, color: .appWhite)
        
        enterGameBtn.tintColor = .appColor
        
        enterCodeTF.placeholder = "Enter Code"
        enterCodeTF.setPlaceholderColor(.appWhite)
        enterCodeTF.textColor = .appWhite
        enterCodeTF.limitCharacterCount(6)
        enterCodeTF.keyboardType = .numberPad
        enterCodeTF.allowOnlyNumericInput()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @objc func doneButtonTapped() {
        enterCodeTF.resignFirstResponder()
    }
}
