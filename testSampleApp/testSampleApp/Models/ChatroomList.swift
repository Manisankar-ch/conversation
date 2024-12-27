//
//  ChatroomList.swift
//  testSampleApp
//
//  Created by Softsuave-iOS dev on 27/12/24.
//


import Foundation

struct ChatroomList: Codable {
    let chatrooms: [Chatroom]
}

struct Chatroom: Codable {
    let id: String
    let name: String
    let participants: [Participant]
    let messages: [Message]
    let lastMessage: Message
}

struct Participant: Codable {
    let id: String
    let name: String
}

struct Message: Codable {
    let id: String
    let senderId: String
    let content: String
    let timestamp: String
}
