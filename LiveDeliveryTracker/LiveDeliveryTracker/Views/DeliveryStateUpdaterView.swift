//
//  OrderStateUpdaterView.swift
//  ActivityTimeTracker
//
//  Created by TanjilaNur-00115 on 27/10/23.
//

import SwiftUI
import ActivityKit

struct DeliveryStateUpdaterView: View {
    
    ///Initialize the LiveActivityHelper
    let helper: LiveActivityHelper = LiveActivityHelper()
    
    var body: some View {
        
        /// VStack of State Updater Buttons
        VStack(spacing: 16) {
            
            /// Start Button
            Button {
                DispatchQueue
                    .main
                    .asyncAfter(deadline: .now() + 2,
                                execute: {
                        helper.start()
                    })
                
            } label: {
                Text("Start") /// Display the button title
                    .font(.title3) /// Set the font size and style
                    .fontWeight(.semibold) ///Specify font weight
                    .frame(width: 250, height: 45) /// Set the button's dimensions
                    .foregroundColor(.white) /// Set text color to white
                    .background(Color(hex: "3876BF")) /// Set the button's background color
                    .cornerRadius(10) /// Apply corner radius to create rounded corners
            }
            
            /// Update with In Progress Button
            Button {
                DispatchQueue
                    .main
                    .asyncAfter(deadline: .now() + 2,
                                execute: {
                        helper.update()
                    })
                
            } label: {
                
                Text("Update with In progress") /// Display the button title
                    .font(.title3) /// Set the font size and style
                    .fontWeight(.semibold) ///Specify font weight
                    .frame(width: 250, height: 45) /// Set the button's dimensions
                    .foregroundColor(.white) /// Set text color to white
                    .background(Color(hex: "FF9130")) /// Set the button's background color
                    .cornerRadius(10)
            }
            
            /// End with success status biutton
            Button {
                DispatchQueue
                    .main
                    .asyncAfter(deadline: .now() + 2,
                                execute: {
                        helper.end(with: .succeed)
                    })
                
            } label: {
                Text("End with Succed") /// Display the button title
                    .font(.title3) /// Set the font size and style
                    .fontWeight(.semibold) ///Specify font weight
                    .frame(width: 250, height: 45) /// Set the button's dimensions
                    .foregroundColor(.white) /// Set text color to white
                    .background(Color(hex: "4A772F")) /// Set the button's background color
                    .cornerRadius(10)
            }
            
            
            /// End with failed status biutton
            Button {
                DispatchQueue
                    .main
                    .asyncAfter(deadline: .now() + 2,
                                execute: {
                        helper.end(with: .failed)
                    })
                
            } label: {
                Text("End with Failed") /// Display the button title
                    .font(.title3) /// Set the font size and style
                    .fontWeight(.semibold) ///Specify font weight
                    .frame(width: 250, height: 45) /// Set the button's dimensions
                    .foregroundColor(.white) /// Set text color to white
                    .background(Color(hex: "A7095C")) /// Set the button's background color
                    .cornerRadius(10)
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DeliveryStateUpdaterView()
    }
}
