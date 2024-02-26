//
//  CreateUserViewController.swift
//  Darevia
//
//  Created by Berkan Gezgin on 25.02.2024.
//

import UIKit

class CreateUserViewController: UIViewController {

    @IBOutlet weak var titleL: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var backBtnImg: UIImageView!
    
    @IBOutlet weak var boxV: UIView!
    @IBOutlet weak var nameV: UIView!
    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var gender1V: UIView!
    @IBOutlet weak var gender1L: UILabel!
    @IBOutlet weak var gender1Btn: UIButton!
    
    @IBOutlet weak var gender2V: UIView!
    @IBOutlet weak var gender2L: UILabel!
    @IBOutlet weak var gender2Btn: UIButton!
    
    @IBOutlet weak var gender3V: UIView!
    @IBOutlet weak var gender3L: UILabel!
    @IBOutlet weak var gender3Btn: UIButton!
    
    @IBOutlet weak var createUserBtnV: UIView!
    @IBOutlet weak var createUserL: UILabel!
    @IBOutlet weak var createUserBtn: UIButton!
    
    var gender = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setView()
    }
    
    private func setView() {
        view.backgroundColor = .appWhite
        
        titleL.text = "DAREVIA"
        titleL.textColor = .appColor
        titleL.font = UIFont.boldSystemFont(ofSize: 20)
        
        backBtnImg.tintColor = .appColor
        
        nameV.backgroundColor = .appWhite
        nameV.applyCornerRadius()
        nameV.addBorder(width: 2, color: .appColor)
        
        nameTF.placeholder = "Please enter your name..." //  TODO: Lang
        nameTF.setPlaceholderColor(.appColor)
        nameTF.font = .systemFont(ofSize: 17)
        nameTF.limitCharacterCount(15)
        nameTF.textColor = .appColor
        nameTF.addDoneButtonToKeyboard(target: self, action: #selector(doneButtonTapped))
        
        gender1L.text = "Man" //  TODO: Lang
        gender1L.textColor = .appColor
        gender1L.font = .systemFont(ofSize: 17)
        gender1V.backgroundColor = .appWhite
        gender1V.applyCornerRadius()
        gender1V.addBorder(width: 2, color: .appColor)
        
        gender2L.text = "Woman" //  TODO: Lang
        gender2L.textColor = .appColor
        gender2L.font = .systemFont(ofSize: 17)
        gender2V.backgroundColor = .appWhite
        gender2V.applyCornerRadius()
        gender2V.addBorder(width: 2, color: .appColor)
        
        gender3L.text = "Other" //  TODO: Lang
        gender3L.textColor = .appColor
        gender3L.font = .systemFont(ofSize: 17)
        gender3V.backgroundColor = .appWhite
        gender3V.applyCornerRadius()
        gender3V.addBorder(width: 2, color: .appColor)
        
        createUserBtnV.backgroundColor = .appColor
        createUserBtnV.applyCornerRadius()
        
        createUserL.text = "Create" //  TODO: Lang
        createUserL.font = .boldSystemFont(ofSize: 17)
        createUserL.textColor =  .appWhite
    }

    @IBAction func backBtnClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func gender1Clicked(_ sender: Any) {
        gender = "Man"
        gender1V.backgroundColor = .appColor
        gender1L.textColor = .appWhite
        
        gender2V.backgroundColor = .appWhite
        gender2L.textColor = .appColor
        
        gender3V.backgroundColor = .appWhite
        gender3L.textColor = .appColor
    }
    
    @IBAction func gender2Clicked(_ sender: Any) {
        gender = "Woman"
        gender2V.backgroundColor = .appColor
        gender2L.textColor = .appWhite
        
        gender1V.backgroundColor = .appWhite
        gender1L.textColor = .appColor
        
        gender3V.backgroundColor = .appWhite
        gender3L.textColor = .appColor
    }
    
    @IBAction func gender3Clicked(_ sender: Any) {
        gender = "Other"
        gender3V.backgroundColor = .appColor
        gender3L.textColor = .appWhite
        
        gender1V.backgroundColor = .appWhite
        gender1L.textColor = .appColor
        
        gender2V.backgroundColor = .appWhite
        gender2L.textColor = .appColor
    }
    
    @IBAction func createUserBtnClicked(_ sender: Any) {
        if nameTF.text != "" {
            if gender != "" {
                let newUser = User(userID: "5", userName: "\(nameTF.text!)", gender: "\(self.gender)", roomID: "1", score: 0)
                SharedData.shared.gameRoomUsers.append(newUser)
                
                if let waitingRoomVC = UIStoryboard(name: "Main", bundle: nil)
                    .instantiateViewController(withIdentifier: "WaitingRoomVC") as? WaitingRoomViewController {
                    waitingRoomVC.modalPresentationStyle = .fullScreen
                    present(waitingRoomVC, animated: true, completion: nil)
                }
            } else {
                let alertController = UIAlertController(title: "Empty space", message: "Please select your gender!", preferredStyle: .alert) // TODO: Lang

                let confirmAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(confirmAction)

                present(alertController, animated: true, completion: nil)
            }
        } else {
            let alertController = UIAlertController(title: "Empty space", message: "Please enter your name!", preferredStyle: .alert) // TODO: Lang

            let confirmAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(confirmAction)

            present(alertController, animated: true, completion: nil)
            
        }
    }
    
    @objc func doneButtonTapped() {
        nameTF.resignFirstResponder()
    }
}
