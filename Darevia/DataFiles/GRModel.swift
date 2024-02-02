//
//  GRModel.swift
//  Darevia
//
//  Created by Berkan Gezgin on 1.02.2024.
//

import Foundation
import UIKit

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

struct Comments {
    let commentID: String
    let commenterUser: String
    let commentText: String
    
    init(commentID: String, commenterUser: String, commentText: String) {
        self.commentID = commentID
        self.commenterUser = commenterUser
        self.commentText = commentText
    }
}


class SharedData {
    static let shared = SharedData()
    var gameType: [GameType] = []
    var comments: [Comments] = []
        
    private init() {
        let gameType1 = GameType(gameTypeID: "1", gameTypeName: "Example 1", questions: ["Question1", 
                                                                                         "Question2",
                                                                                         "Question3",
                                                                                         "Question4",
                                                                                         "Question5"], gameRoomColor: .systemYellow)
        let gameType2 = GameType(gameTypeID: "2", gameTypeName: "Example 2", questions: ["Question1", 
                                                                                         "Question2",
                                                                                         "Question3",
                                                                                         "Question4",
                                                                                         "Question5"], gameRoomColor: .systemPink)
        let gameType3 = GameType(gameTypeID: "3", gameTypeName: "Example 3", questions: ["Question1", 
                                                                                         "Question2",
                                                                                         "Question3",
                                                                                         "Question4",
                                                                                         "Question5"], gameRoomColor: .systemGreen)
        let gameType4 = GameType(gameTypeID: "4", gameTypeName: "Example 4", questions: ["Question1", 
                                                                                         "Question2",
                                                                                         "Question3",
                                                                                         "Question4",
                                                                                         "Question5"], gameRoomColor: .systemOrange)
        let gameType5 = GameType(gameTypeID: "5", gameTypeName: "Example 5", questions: ["Question1", 
                                                                                         "Question2",
                                                                                         "Question3",
                                                                                         "Question4",
                                                                                         "Question5"], gameRoomColor: .systemTeal)
        self.gameType = [gameType1, gameType2, gameType3, gameType4, gameType5]
        
        let comment1 = Comments(commentID: "1", commenterUser: "TestUser1", commentText: "test comment 1")
        let comment2 = Comments(commentID: "2", commenterUser: "TestUser1", commentText: "test comment 2")
        let comment3 = Comments(commentID: "3", commenterUser: "TestUser1", commentText: "test comment 3")
        let comment4 = Comments(commentID: "4", commenterUser: "TestUser1", commentText: "test comment 4")
        let comment5 = Comments(commentID: "5", commenterUser: "TestUser1", commentText: "test comment 5")
        
        self.comments = [comment1, comment2, comment3, comment4, comment5]
    }
}
