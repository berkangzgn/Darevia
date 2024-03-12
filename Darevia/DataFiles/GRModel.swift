//
//  GRModel.swift
//  Darevia
//
//  Created by Berkan Gezgin on 1.02.2024.
//



// MARK: -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// MARK: This page is a temporary arrangement for the application to continue since there is NO DATABASE. When there is a database connection, all the data on this page will COME FROM THE DATABASE.
// MARK: -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

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
    var score: Int
    
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
    let questions: [String]
    let points: [Int]
    let gameRoomColor: UIColor
    let gameDesc: String
    
    init(gameTypeID: String, gameTypeName: String, gameDetail: String, questions: [String], points: [Int], gameRoomColor: UIColor, gameDesc: String) {
        self.gameTypeID = gameTypeID
        self.gameTypeName = gameTypeName
        self.gameDetail = gameDetail
        self.questions = questions
        self.points = points
        self.gameRoomColor = gameRoomColor
        self.gameDesc = gameDesc
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

struct GameArray {
    let missionType: Int
    let questionNo: Int
    let user1No: Int
    let user2No: Int
    
    init(missionType: Int, questionNo: Int, user1No: Int, user2No: Int) {
        self.missionType = missionType
        self.questionNo = questionNo
        self.user1No = user1No
        self.user2No = user2No
    }
}

struct Game {
    let roomid: String
    var roomUsers: [User]
    let gameType: GameType
    let gameArray: [GameArray]
                 
    init(roomid: String, roomUsers: [User], gameType: GameType, gameArray: [GameArray]) {
        self.roomid = roomid
        self.roomUsers = roomUsers
        self.gameType = gameType
        self.gameArray = gameArray
    }
}

class SharedData {
    static let shared = SharedData()
    var gameType: [GameType] = []
    var comments: [Comments] = []
    var gameRoomUsers: [User] = []
    var gameRoom: [GameRoom] = []
    var mission: [GameArray] = []
    var game: Game
    var arrayNo: Int = 0
        
    // MARK: 
    
    private init() {
        self.gameType = [GameType(gameTypeID: "1", 
                                  gameTypeName: "Game 1",
                                  gameDetail: "2-4 players",
                                  questions: ["Question1",
                                              "Question2",
                                              "Question3",
                                              "Question4",
                                              "Question5"], 
                                  points: [20, 20 , 20, 20, 20],
                                  gameRoomColor: .systemYellow,
                                  gameDesc: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."),
                         GameType(gameTypeID: "2",
                                  gameTypeName: "Game 2",
                                  gameDetail: "2-4 players",
                                  questions: ["Question1",
                                              "Question2",
                                              "Question3",
                                              "Question4",
                                              "Question5"],
                                  points: [20, 20 , 20, 20, 20],
                                  gameRoomColor: .systemRed,
                                  gameDesc: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."),
                         GameType(gameTypeID: "3",
                                  gameTypeName: "Game 3",
                                  gameDetail: "2-4 players",
                                  questions: ["Question1",
                                              "Question2",
                                              "Question3",
                                              "Question4",
                                              "Question5"],
                                  points: [20, 20 , 20, 20, 20],
                                  gameRoomColor: .systemGreen,
                                  gameDesc: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."),
                         GameType(gameTypeID: "4",
                                  gameTypeName: "Game 4",
                                  gameDetail: "2-4 players",
                                  questions: ["Question1",
                                              "Question2",
                                              "Question3",
                                              "Question4",
                                              "Question5"], 
                                  points: [20, 20 , 20, 20, 20],
                                  gameRoomColor: .systemOrange,
                                  gameDesc: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."),
                         GameType(gameTypeID: "5",
                                  gameTypeName: "Game 5",
                                  gameDetail: "2-4 players",
                                  questions: ["Question1",
                                              "Question2",
                                              "Question3",
                                              "Question4",
                                              "Question5"],
                                  points: [20, 20 , 20, 20, 20],
                                  gameRoomColor: .systemTeal,
                                  gameDesc: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.")]

        
        self.comments = [Comments(commentID: "1", 
                                  commenterUser: "TestUser1",
                                  commentText: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do. "),
                         Comments(commentID: "2", 
                                  commenterUser: "TestUser2",
                                  commentText: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do. "),
                         Comments(commentID: "3", 
                                  commenterUser: "TestUser3",
                                  commentText: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do. "),
                         Comments(commentID: "4", 
                                  commenterUser: "TestUser4",
                                  commentText: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do. "),
                         Comments(commentID: "5", 
                                  commenterUser: "TestUser5",
                                  commentText: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do. ")]
        
        
        self.gameRoomUsers = [User(userID: "5", userName: "John", gender: "Man", roomID: "1", score: 0),
                              User(userID: "2", userName: "Abdullah", gender: "Man", roomID: "1", score: 0),
                              User(userID: "3", userName: "Xio", gender: "Woman", roomID: "1", score: 0),
                              User(userID: "4", userName: "Afreen", gender: "Woman", roomID: "1", score: 0)]
        

        self.gameRoom = [GameRoom(roomID: "830175", 
                                  roomType: GameType(gameTypeID: "1",
                                                     gameTypeName: "Game 1",
                                                     gameDetail: "2-4 players",
                                                     questions: ["Question1",
                                                               "Question2",
                                                               "Question3",
                                                               "Question4",
                                                               "Question5"],
                                                     points: [20, 20 , 20, 20, 20],
                                                     gameRoomColor: .systemYellow, 
                                                     gameDesc: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."),
                                  users: gameRoomUsers)]
    
        
        self.mission = [GameArray(missionType: 1, questionNo: 0, user1No: 2, user2No: 1),
                        GameArray(missionType: 2, questionNo: 1, user1No: 4, user2No: 5),
                        GameArray(missionType: 3, questionNo: 2, user1No: 1, user2No: 2),
                        GameArray(missionType: 1, questionNo: 3, user1No: 2, user2No: 3),
                        GameArray(missionType: 2, questionNo: 4, user1No: 3, user2No: 2),
                        GameArray(missionType: 3, questionNo: 5, user1No: 1, user2No: 5),
                        GameArray(missionType: 1, questionNo: 6, user1No: 2, user2No: 4)]
        
        
        self.game = Game(roomid: "830175",
                         roomUsers: self.gameRoomUsers,
                         gameType: GameType(gameTypeID: "1",
                                            gameTypeName: "Game 1",
                                            gameDetail: "2-4 players",
                                            questions: ["Question1",
                                                        "Question2",
                                                        "Question3",
                                                        "Question4",
                                                        "Question5",
                                                        "Question6",
                                                        "Question7"],
                                            points: [20, 20 , 20, 20, 20, 20, 20],
                                            gameRoomColor: .systemYellow, 
                                            gameDesc: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."),
                        gameArray: mission)
    }
}
