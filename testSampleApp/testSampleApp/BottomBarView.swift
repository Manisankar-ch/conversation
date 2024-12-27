//
//  BottomBarView.swift
//  testSampleApp
//
//  Created by Softsuave-iOS dev on 27/12/24.
//

import SwiftUI

struct BottomBarView: View {
    var body: some View {
        @State var selectedTab: Int = 4
        TabView(selection: $selectedTab) {
            Tab("Received", systemImage: "tray.and.arrow.down.fill", value: 0) {
                HomeView()
            }
            Tab("Sent", systemImage: "tray.and.arrow.up.fill", value: 1) {
                Text("2")
            }
            Tab("Account", systemImage: "person.crop.circle.fill", value: 2) {
                Text("3")
            }
            
//            TabSection("Messages") {
//                Tab("Received", systemImage: "tray.and.arrow.down.fill" , value: 3) {
//Text("1")
//                   }
//
//
//                Tab("Sent", systemImage: "tray.and.arrow.up.fill", value: 4) {
//                       Text("1")
//                   }
//                Tab("Account", systemImage: "person.crop.circle.fill", value: 5) {
//                    Text("3")
//                }
//               }
        }
        .tabViewStyle(.sidebarAdaptable)
    }
}

#Preview {
    BottomBarView()
}
