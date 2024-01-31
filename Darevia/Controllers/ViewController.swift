//
//  ViewController.swift
//  Darevia
//
//  Created by Berkan Gezgin on 31.01.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var menuTV: UITableView!
    
    var roomTypeModel = [RoomTypeModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setView()
        
        roomTypeModel.append(RoomTypeModel(typeName: "type1", bgColor: .systemYellow))
        roomTypeModel.append(RoomTypeModel(typeName: "type2", bgColor: .systemPink))
        roomTypeModel.append(RoomTypeModel(typeName: "type3", bgColor: .systemGreen))
        roomTypeModel.append(RoomTypeModel(typeName: "type4", bgColor: .systemOrange))
        roomTypeModel.append(RoomTypeModel(typeName: "type5", bgColor: .systemTeal))
    }
    
    private func setView() {
        menuTV.register(RoomTypeTVC.nib(), forCellReuseIdentifier: RoomTypeTVC.identifier)
        menuTV.delegate = self
        menuTV.dataSource = self
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuTV.dequeueReusableCell(withIdentifier: RoomTypeTVC.identifier, for: indexPath) as! RoomTypeTVC
        cell.configure(with: roomTypeModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1 {
            return 200.0
        } else {
            return 100.0
        }
    }
    
    
}

struct RoomTypeModel {
    let typeName: String
    let bgColor: UIColor
    
    init(typeName: String, bgColor: UIColor) {
        self.typeName = typeName
        self.bgColor = bgColor
    }
}
