//
//  StatusAttribute.swift
//  ActivityTimeTracker
//
//  Created by TanjilaNur-00115 on 27/10/23.
//

import SwiftUI
import WidgetKit
import ActivityKit

/// StatusAttribute' that conforms to the 'ActivityAttributes' protocol.
struct StatusAttribute: ActivityAttributes {
  public typealias ProcessStatus = ContentState
  
  /// ContentState
  public struct ContentState: Codable, Hashable {
    /// Store the current status as 'status'.
    var status: Status
      
    /// Variable to store the estimated completion time
    var estimatedCompletionTime: Date
  }
  
  /// Variable to store the name of Item.
  var name: String
}

