//
//  Model.swift
//  Darevia
//
//  Created by Berkan Gezgin on 1.02.2024.
//

import Foundation
import UIKit

struct RoomTypeModel {
    let typeName: String
    let bgColor: UIColor
    
    init(typeName: String, bgColor: UIColor) {
        self.typeName = typeName
        self.bgColor = bgColor
    }
}

struct GameRoom {
    let roomID: String
    let roomType: [GameType]?
    let users: [User]?
    let roomName: String
    
    init(roomID: String, roomType: [GameType]?, users: [User]?, roomName: String) {
        self.roomID = roomID
        self.roomType = roomType
        self.users = users
        self.roomName = roomName
    }
}

struct User {
    let userID: String
    let userName: String
    let gender: String
    let roomID: String
    let score: Int
    
    init(userID: String, userName: String, gender: String, roomID: String, score: Int) {
        self.userID = userID
        self.userName = userName
        self.gender = gender
        self.roomID = roomID
        self.score = score
    }
}

struct GameType {
    let gameTypeID: String
    let gameTypeName: String
    let questions: [String]?
    let gameRoomColor: UIColor
    
    init(gameTypeID: String, gameTypeName: String, questions: [String]?, gameRoomColor: UIColor) {
        self.gameTypeID = gameTypeID
        self.gameTypeName = gameTypeName
        self.questions = questions
        self.gameRoomColor = gameRoomColor
    }
}
