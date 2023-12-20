//
//  LiveActivityHelper.swift
//  ActivityTimeTracker
//
//  Created by TanjilaNur-00115 on 27/10/23.
//

import Foundation
import ActivityKit

class LiveActivityHelper {
    
    var statusActivity: Activity<StatusAttribute>?
    
    /// Function to start the order process
    func start() {
        
        /// Check if activity is enabled.
        guard ActivityAuthorizationInfo().areActivitiesEnabled else {
            print("Activities are not enabled!")
            return
        }
        
        /// Initializing the models
        let statusAttribute = StatusAttribute(name: "Pizza")
        let initialStatus = StatusAttribute.ProcessStatus(status: .pending,
                                                          estimatedCompletionTime: Date())
        
        /// Tell iOS that there is a new activity started!
        do {
            statusActivity = try Activity<StatusAttribute>.request(
                attributes: statusAttribute,
                contentState: initialStatus,
                pushType: nil)
            
            guard let statusActivity else {
                print("Error: Could not initialize activity.")
                return
            }
            
            print("Order: \(statusActivity.id) is now pending.")
        } catch (let error) {
            print("Error: \(error.localizedDescription)")
        }
        
    }
    
    /// Function to update the order process with In progress
    func update() {
        Task {
            let updatedStatus = StatusAttribute.ProcessStatus(status: .inProgress,
                                                              estimatedCompletionTime: Date())
            guard let statusActivity else { return }
            await statusActivity.update(using: updatedStatus)
        }
    }
    
    /// Function to end the order process
    func end(with status: Status) {
        Task {
            let updatedStatus = StatusAttribute.ProcessStatus(status: status, estimatedCompletionTime: Date())
            
            guard let statusActivity else { return }
            await statusActivity.end(using: updatedStatus, dismissalPolicy: .default)
        }
    }
    
}
