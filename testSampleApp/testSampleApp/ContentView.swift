//
//  ContentView.swift
//  testSampleApp
//
//  Created by Softsuave-iOS dev on 17/12/24.
//

//import SwiftUI
//
//struct ContentView: View {
//    @AllCaps var name: String = "test"
//    
//    var body: some View {
//        NowPlayingView()
//            .padding()
//            .onAppear() {
//                print("----", name)
//            }
//    }
//}

import SwiftUI
import AVFoundation
import MediaPlayer
import ActivityKit

struct ContentView: View {
    @StateObject private var audioManager = AudioManager()
    
    var body: some View {
        VStack {
            BottomBarView()
//            Button(action: {
////                audioManager.playPauseAudio()
//                let attributes = testWidgetExtensionAttributes(name: "test")
//                let contentState =  testWidgetExtensionAttributes.ContentState(emoji: "")
//                
//                  let liveActivity = try? Activity<testWidgetExtensionAttributes>.request(attributes: attributes, content: ActivityContent(state: contentState, staleDate: .none) , pushType: .none)
//                print(liveActivity?.id)
//            }) {
//                Text(audioManager.isPlaying ? "Pause" : "Play")
//                    .padding()
//                    .background(Color.blue)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//            }
//            
//            Link("test", destination: URL(string: "")!)
        }
//        .onAppear {
//            audioManager.setupPlayer()
//            audioManager.setupAudioSession()
//            audioManager.setupNotifications()
//        }
//        .onDisappear {
//            audioManager.stopAudio()
//        }
    }
}

#Preview {
    ContentView()
}

@propertyWrapper
struct AllCaps {
    var wrappedValue: String {
        didSet {
            wrappedValue = wrappedValue.uppercased()
        }
        
    }
    
    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue.uppercased()
    }
    
}
