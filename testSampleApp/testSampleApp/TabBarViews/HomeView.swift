//
//  HomeView.swift
//  testSampleApp
//
//  Created by Softsuave-iOS dev on 27/12/24.
//
import SwiftUI
struct HomeView: View {
    var members: ChatroomList? = nil
    var body: some View {
        VStack {
            Text("ch")
            if let chatRooms = members?.chatrooms {
                chatRooms.forEach( { room in
                ChatMemberView(member: room)
                })
            } else {struct HomeView: View {
                var members: ChatroomList? = nil

                var body: some View {
                    VStack {
                        Text("ch")
                        if let chatRooms = members?.chatrooms {
                            ForEach(chatRooms, id: \.id) { room in
                                ChatMemberView(member: room)
                            }
                        } else {
                            Text("No chatrooms available")
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                }
            }
        

//
//#Preview {
//    HomeView()
//}

struct ChatMemberView: View {
    var member: Chatroom
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "house")
            Text(member.name)
                .foregroundStyle(Color.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            Text("")
            
        }
    }
}


