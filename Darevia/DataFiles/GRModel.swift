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
    let roomType: GameType
    let users: [User]
    
    init(roomID: String, roomType: GameType, users: [User]) {
        self.roomID = roomID
        self.roomType = roomType
        self.users = users
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
    let gameDetail: String
    let questions: [String]?
    let gameRoomColor: UIColor
    
    init(gameTypeID: String, gameTypeName: String, gameDetail: String, questions: [String]?, gameRoomColor: UIColor) {
        self.gameTypeID = gameTypeID
        self.gameTypeName = gameTypeName
        self.gameDetail = gameDetail
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
    var gameRoomUsers: [User] = []
    var gameRoom: [GameRoom] = []
        
    private init() {
        let gameType1 = GameType(gameTypeID: "1", gameTypeName: "Game 1", gameDetail: "2-4 players",
                                 questions: ["Question1",
                                             "Question2",
                                             "Question3",
                                             "Question4",
                                             "Question5"], gameRoomColor: .systemYellow)
        let gameType2 = GameType(gameTypeID: "2", gameTypeName: "Game 2", gameDetail: "2-4 players",
                                 questions: ["Question1",
                                             "Question2",
                                             "Question3",
                                             "Question4",
                                             "Question5"], gameRoomColor: .appBluredColor)
        let gameType3 = GameType(gameTypeID: "3", gameTypeName: "Game 3", gameDetail: "2-4 players",
                                 questions: ["Question1",
                                             "Question2",
                                             "Question3",
                                             "Question4",
                                             "Question5"], gameRoomColor: .systemGreen)
        let gameType4 = GameType(gameTypeID: "4", gameTypeName: "Game 4", gameDetail: "2-4 players",
                                 questions: ["Question1",
                                             "Question2",
                                             "Question3",
                                             "Question4",
                                             "Question5"], gameRoomColor: .systemOrange)
        let gameType5 = GameType(gameTypeID: "5", gameTypeName: "Game 5", gameDetail: "2-4 players",
                                 questions: ["Question1",
                                             "Question2",
                                             "Question3",
                                             "Question4",
                                             "Question5"], gameRoomColor: .systemTeal)
        self.gameType = [gameType1, gameType2, gameType3, gameType4, gameType5]
        
        let comment1 = Comments(commentID: "1", commenterUser: "TestUser1", commentText: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ")
        let comment2 = Comments(commentID: "2", commenterUser: "TestUser1", commentText: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ")
        let comment3 = Comments(commentID: "3", commenterUser: "TestUser1", commentText: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ")
        let comment4 = Comments(commentID: "4", commenterUser: "TestUser1", commentText: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ")
        let comment5 = Comments(commentID: "5", commenterUser: "TestUser1", commentText: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ")
        
        self.comments = [comment1, comment2, comment3, comment4, comment5]
        
        let user1 = User(userID: "1", userName: "John", gender: "Man", roomID: "1", score: 0)
        let user2 = User(userID: "2", userName: "Abdullah", gender: "Man", roomID: "1", score: 0)
        let user3 = User(userID: "3", userName: "Xio", gender: "Woman", roomID: "1", score: 0)
        let user4 = User(userID: "4", userName: "Afreen", gender: "Woman", roomID: "1", score: 0)
        
        self.gameRoomUsers = [user1, user2, user3, user4]
        
        let gameRoom1 = GameRoom(roomID: "830175", roomType: gameType1, users: gameRoomUsers)
        self.gameRoom = [gameRoom1]
    }
}
