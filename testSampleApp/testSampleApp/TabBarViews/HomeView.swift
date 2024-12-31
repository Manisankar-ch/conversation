//
//  HomeView.swift
//  testSampleApp
//
import SwiftUI

struct HomeView: View {
    @State var members: ChatroomList? = nil
    @State var isLoading: Bool = false
    var body: some View {
        VStack {
            if isLoading {
                ProgressView()
                    .progressViewStyle(.circular)
            } else {
                if let chatRooms = members?.chatrooms {
                    ScrollView {
                        ForEach(chatRooms, id: \.id) { room in
                            ChatRoomListView(member: room)
                        }
                    }
                    .border(Color.black)
                } else {
                    Text("No chat rooms found")
                }
            }
        }
        .safeAreaPadding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .border(Color.red)
        .onAppear {
            getRoomDetails()
        }
    }
    
    func getRoomDetails() {
        self.isLoading.toggle()
        if let url = Bundle.main.url(forResource: "chatRooms", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                members = try decoder.decode(ChatroomList.self, from: data)
            } catch {
                print("Error: \(error)")
            }
        }
        self.isLoading.toggle()
    }
}

#Preview {
    HomeView()
}


struct ChatRoomListView: View {
    var member: Chatroom
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: member.thumbnailUrl)!) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .clipShape(.capsule)
            .frame(width: 50, height: 50)
            VStack(spacing: 0) {
                HStack() {
                    Text(member.name)
                        .foregroundStyle(Color.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .lineLimit(1)
                        .font(.caption)
                    Text(formatMessageDate(member.lastMessage.timestamp))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .lineLimit(1)
                        .font(.footnote)
                }
                .padding([.top, .horizontal], 5)
                
                HStack {
                    Text(member.lastMessage.content)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .lineLimit(1)
                        .font(.caption2)
                    
                    if member.unreadMessageCount > 0 {
                        Text("\(member.unreadMessageCount)")
                            .font(.footnote)
                            .padding(6)
                            .background(Color.blue)
                            .clipShape(.circle)
                    }
                }
                .padding([.bottom, .horizontal], 5)
            }
            
        }
        .border(Color.gray)
        .padding(.horizontal, 20)
    }
    
    func formatMessageDate(_ dateString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        guard let messageDate = formatter.date(from: dateString) else {
            return "Invalid Date"
        }
        
        let calendar = Calendar.current
        
        // Check if the message was sent today
        if calendar.isDateInToday(messageDate) {
            formatter.dateFormat = "hh:mm a"
            return formatter.string(from: messageDate)
        }
        
        // Check if the message was sent yesterday
        if calendar.isDateInYesterday(messageDate) {
            return "Yesterday"
        }
        if isDateInThisWeek(date: messageDate, calendar: calendar) {
            let weekdayFormatter = DateFormatter()
            weekdayFormatter.dateFormat = "EEEE"
            return weekdayFormatter.string(from: messageDate)
        } else {
            
            // For other days (Monday - Friday)
            formatter.dateFormat = "dd/MM/yy"
            return formatter.string(from: messageDate)
        }
        
    }
    
    func isDateInThisWeek(date: Date, calendar: Calendar) -> Bool {
        let currentDate = Date()
        
        // Get the start of the current week
        guard let startOfWeek = calendar.dateInterval(of: .weekOfYear, for: currentDate)?.start else {
            return false
        }
        return calendar.isDate(date, inSameDayAs: startOfWeek) || (date > startOfWeek && date < currentDate)
    }
}
