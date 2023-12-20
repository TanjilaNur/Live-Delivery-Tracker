//
//
//  Status.swift
//  ActivityTimeTracker
//
//  Created by TanjilaNur-00115 on 27/10/23.
//

import Foundation

/// Enumeration for Status types that conforms to the 'Codable' protocol.
enum Status: Codable {
  case pending
  case inProgress
  case succeed
  case failed
  
  /// Computed property 'isDone' returns true for 'succeed' and 'failed' statuses
  var isDone: Bool {
      return self == .failed || self == .succeed
  }
  
  /// Computed property 'title' returns a for each status case.
  var title: String {
    switch self {
    case .pending:
      return "Pending"
    case .inProgress:
      return "In Progress"
    case .succeed:
      return "Succeed"
    case .failed:
      return "Failed"
    }
  }
  
  /// Computed property 'icon' returns an icon name associated with each status case.
  var icon: String {
    switch self {
    case .pending:
      return "pending"
    case .inProgress:
      return "in-progress"
    case .succeed:
      return "succeed"
    case .failed:
      return "failed"
    }
  }
}


