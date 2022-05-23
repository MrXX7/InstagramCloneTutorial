//
//  NotificationsCellViewModel.swift
//  InstagramCloneTutorial
//
//  Created by Oncu Ohancan on 23.05.2022.
//

import SwiftUI
import Firebase

class NotificationsCellViewModel: ObservableObject {
    
    @Published var notification: Notification
    
    init(notification: Notification) {
        self.notification = notification
        fetchUser()
    }
    
    var timestamp: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: notification.timestamp.dateValue(), to: Date()) ?? ""
    }
    func fetchUser() {
        Firestore.firestore().collection("users").document(notification.uid).getDocument { (snap, err) in
            if let err = err {
                print(err.localizedDescription)
                return
            }
        self.notification.user = try? snap?.data(as: User.self)
        }
    }
}
