//
//  GameViewController.swift
//  Darevia
//
//  Created by Berkan Gezgin on 14.02.2024.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var topV: UIView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var backBtnImg: UIImageView!
    @IBOutlet weak var titleL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setView()
    }
    
    private func setView() {
        
    }
    
    @IBAction func bakcBtnClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
