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
        view.backgroundColor = .appColor
        
        titleL.text = "DAREVIA"
        titleL.textColor = .appWhite
        titleL.font = UIFont.boldSystemFont(ofSize: 20)
        
        backBtnImg.tintColor = .appWhite
        
        boxV.backgroundColor = .appBluredColor
        boxV.applySoftCornerRadius()
        
        nameV.backgroundColor = .appColor
        nameV.applyCornerRadius()
        nameV.addBorder(width: 2, color: .appWhite)
        
        nameTF.placeholder = "Please enter your name..." //  TODO: Lang
        nameTF.setPlaceholderColor(.appWhite)
        nameTF.font = .systemFont(ofSize: 17)
        nameTF.limitCharacterCount(15)
        nameTF.textColor = .appWhite
        nameTF.addDoneButtonToKeyboard(target: self, action: #selector(doneButtonTapped))
        
        gender1L.text = "Man" //  TODO: Lang
        gender1L.textColor = .appWhite
        gender1L.font = .systemFont(ofSize: 17)
        gender1V.backgroundColor = .appColor
        gender1V.applyCornerRadius()
        
        gender2L.text = "Woman" //  TODO: Lang
        gender2L.textColor = .appWhite
        gender2L.font = .systemFont(ofSize: 17)
        gender2V.backgroundColor = .appColor
        gender2V.applyCornerRadius()
        
        gender3L.text = "Other" //  TODO: Lang
        gender3L.textColor = .appWhite
        gender3L.font = .systemFont(ofSize: 17)
        gender3V.backgroundColor = .appColor
        gender3V.applyCornerRadius()
        
        createUserBtnV.backgroundColor = .appWhite
        createUserBtnV.applyCornerRadius()
        
        createUserL.text = "Create" //  TODO: Lang
        createUserL.font = .systemFont(ofSize: 17)
        createUserL.textColor =  .appColor
    }

    @IBAction func backBtnClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func gender1Clicked(_ sender: Any) {
        gender = "Man"
        gender1V.backgroundColor = .appWhite
        gender1L.textColor = .appColor
        
        gender2V.backgroundColor = .appColor
        gender2L.textColor = .appWhite
        
        gender3V.backgroundColor = .appColor
        gender3L.textColor = .appWhite
    }
    
    @IBAction func gender2Clicked(_ sender: Any) {
        gender = "Woman"
        gender2V.backgroundColor = .appWhite
        gender2L.textColor = .appColor
        
        gender1V.backgroundColor = .appColor
        gender1L.textColor = .appWhite
        
        gender3V.backgroundColor = .appColor
        gender3L.textColor = .appWhite
    }
    
    @IBAction func gender3Clicked(_ sender: Any) {
        gender = "Other"
        gender3V.backgroundColor = .appWhite
        gender3L.textColor = .appColor
        
        gender1V.backgroundColor = .appColor
        gender1L.textColor = .appWhite
        
        gender2V.backgroundColor = .appColor
        gender2L.textColor = .appWhite
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
