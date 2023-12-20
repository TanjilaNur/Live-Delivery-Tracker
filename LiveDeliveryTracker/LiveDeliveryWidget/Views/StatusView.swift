//
//  ContentView.swift
//  ActivityTimeTracker
//
//  Created by TanjilaNur-00115 on 27/10/23.
//

import SwiftUI

struct StatusView: View {
    
    @State var attribute: StatusAttribute
    @State var state: StatusAttribute.ContentState
    
    var body: some View {
        ZStack {
            ///Widget Background Color
            Color(hex: "EBEBEB")
            
            HStack(spacing: 5) {
                
                ///Delivery State Icon
                Image(state.status.icon)
                    .frame(width: 15, height: 18)
                    .padding(.trailing, 20)
                    .padding(.leading, 15)

                VStack(alignment: .leading, spacing: 3) {
                    
                    /// Process State wise Status
                    HStack(spacing: 3){
                        if state.status == .pending {
                            
                            ///Status for pending state
                            Text("Order received!")
                                .foregroundStyle(Color.black)
                                .font(.system(size: 18, weight: .bold))
                        } else if state.status == .inProgress {
                            
                            ///Status for In progress state
                            Text("In Progress!")
                                .foregroundStyle(Color.black)
                                .font(.system(size: 18, weight: .bold))
                                .padding(.top, 8)
                        } else if state.status == .succeed {
                            
                            ///Status for Succeed state
                            Text("Successfully delivered!")
                                .foregroundStyle(Color.green)
                                .font(.system(size: 18, weight: .bold))
                                .padding(.top, 8)
                        } else {
                            
                            ///Status for Failed state
                            Text("Delivery Failed!")
                                .foregroundStyle(Color.red)
                                .font(.system(size: 18, weight: .bold))
                                .padding(.top, 8)
                        }
                        
                        Spacer()
                        
                        /// Estimated Completion Time
                        if state.status.isDone {
                            /// If done then no need to show elapsed time
                            Text("")
                                .foregroundStyle(Color.black)
                                .font(.system(size: 14, weight: .bold))
                                .multilineTextAlignment(.trailing)
                        } else {
                            /// Show elapsed time
                            Text("\(state.estimatedCompletionTime, style: .timer)") //⌛
                                .foregroundStyle(Color.black)
                                .font(.system(size: 14, weight: .regular))
                                .multilineTextAlignment(.trailing)
                        }
                        
                    }
                    
                    /// State wise Status Description
                    if state.status == .pending {
                        
                        ///Status Description for pending state
                        Text("We have received your order for \(attribute.name).")
                            .foregroundStyle(Color.black)
                            .font(.system(size: 15, weight: .regular))
                            .padding(.top, 8)
                    } else if state.status == .inProgress {
                        
                        ///Statius Description for In progress state
                        Text("Your \(attribute.name) is on the way!")
                            .foregroundStyle(Color.black)
                            .font(.system(size: 15, weight: .regular))
                            .padding(.top, 8)
                    } else if state.status == .succeed {
                        
                        ///Statius Description for succeed state
                        Text("Your \(attribute.name) is successfully delivered!")
                            .foregroundStyle(Color.black)
                            .font(.system(size: 15, weight: .regular))
                            .padding(.top, 8)
                    } else {
                        
                        ///Statius Description for Failed state
                        Text("Couldn't deliver Your \(attribute.name)!")
                            .foregroundStyle(Color.black)
                            .font(.system(size: 15, weight: .regular))
                            .padding(.top, 8)
                    }
                    
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 10)
            .padding(.top, 7)
            .padding(.bottom, 7)
            
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 79)
        .shadow(color: .black.opacity(0.25), radius: 40, x: 0, y: 10)
    }
}



