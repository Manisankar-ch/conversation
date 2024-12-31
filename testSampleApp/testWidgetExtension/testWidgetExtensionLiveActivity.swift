//
//  testWidgetExtensionLiveActivity.swift
//  testWidgetExtension
//
//  Created by Mani dev on 26/12/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct testWidgetExtensionAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct testWidgetExtensionLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: testWidgetExtensionAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
                Link("test the screen", destination: URL(string: "https://itunes.apple.com/in/app/appName/?mt=8&action=write-review")!)
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension testWidgetExtensionAttributes {
    fileprivate static var preview: testWidgetExtensionAttributes {
        testWidgetExtensionAttributes(name: "World")
    }
}

extension testWidgetExtensionAttributes.ContentState {
    fileprivate static var smiley: testWidgetExtensionAttributes.ContentState {
        testWidgetExtensionAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: testWidgetExtensionAttributes.ContentState {
         testWidgetExtensionAttributes.ContentState(emoji: "🤩")
     }
}

//#Preview("Notification", as: .content, using: testWidgetExtensionAttributes.preview) {
//   testWidgetExtensionLiveActivity()
//} contentStates: {
//    testWidgetExtensionAttributes.ContentState.smiley
//    testWidgetExtensionAttributes.ContentState.starEyes
//}
