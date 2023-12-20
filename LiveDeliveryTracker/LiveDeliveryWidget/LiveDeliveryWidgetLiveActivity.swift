//
//  WidgetExtension.swift
//  LiveDeliveryTracker
//
//  Created by TanjilaNur-00115 on 27/10/23.
//

import WidgetKit
import SwiftUI
import Intents


struct LiveDeliveryWidgetLiveActivity: Widget {
        
    ///Configuration for LiveActivity and Dynamic Islands
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: StatusAttribute.self) { context in
                
                if #available(iOSApplicationExtension 17.0, *) {
                    
                    /// Lock screen/banner UI goes here
                    StatusView(attribute: context.attributes, state: context.state)
                        .activityBackgroundTint(Color.cyan)
                        .activitySystemActionForegroundColor(Color.black)
                    
                        /// Container Bacground of widget view
                        .containerBackground(for: .widget) {
                            Color.white.opacity(0.3)
                        }
                } else {
                    /// Lock screen/banner UI without ContainerBG
                    StatusView(attribute: context.attributes, state: context.state)
                        .activityBackgroundTint(Color.cyan)
                        .activitySystemActionForegroundColor(Color.black)
                }
            
        } dynamicIsland: { context in
            
            /// Dynamic island configuration for different sizes and positions.
            DynamicIsland {
                DynamicIslandExpandedRegion(.center) {
                    
                    ///Show State wise Status Description  icon
                    if context.state.status.title == "Pending" {
                        Text("We have received your order.")
                            .font(.system(size: 15, weight: .regular))
                            .padding(.top, 8)
                    } else {
                        Text("Your delivery is In progress.")
                            .font(.system(size: 15, weight: .regular))
                            .padding(.top, 8)
                    }
                }
            } compactLeading: {
                
                ///Show State wise Status  icon
                if context.state.status.title == "Pending" {
                    Image(systemName: "clock.arrow.circlepath")
                        .foregroundColor(.yellow)
                } else {
                    Image(systemName: "box.truck.badge.clock")
                        .foregroundColor(.green)
                }
            } compactTrailing: {
                
                /// Display the estimated completion time as a timer-style text.
                Text("\(context.state.estimatedCompletionTime,style: .timer)")
                    .padding()
                    .foregroundColor(.red)
                    .multilineTextAlignment(.trailing)
            } minimal: {
                
                /// Show State wise Status  icon
                if context.state.status.title == "Pending" {
                    Image(systemName: "clock.arrow.circlepath")
                        .foregroundColor(.yellow)
                } else {
                    Image(systemName: "box.truck.badge.clock")
                        .foregroundColor(.green)
                }
                
            }
        }
    }
}

///Preview
struct WidgetExtension_Previews: PreviewProvider {
    static var previews: some View {
        let testAttribute = StatusAttribute(name: "Pizza")
        let testState = StatusAttribute.ContentState(
            status: .pending,
            estimatedCompletionTime: Date()
        )
        
        StatusView(attribute: testAttribute, state: testState)
            .previewContext(
                WidgetPreviewContext(
                    family: .systemLarge
                )
            )
    }
}
