//
//  NotificationViewModel.swift
//  InstagramCloneTutorial
//
//  Created by Oncu Ohancan on 21.05.2022.
//

import SwiftUI
import Firebase

class NotificationViewModel: ObservableObject {
    
   static func sendNotification(withUid uid: String, type: NotificationType, post: Post? = nil) {
        
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let userId = user.id else { return }
        
        var data: [String: Any] = ["timestamp": Timestamp(date: Date()),
                                   "username" : user.username,
                                   "uid" : userId,
                                   "profileImageURL" : user.profileImageURL,
                                   "type" : type.rawValue]
        
        if let post = post, let id = post.id {
            data["postId"] = id
        }
        
        Firestore.firestore().collection("notifications").document(uid).collection("user-notifications").addDocument(data: data) { (err) in
            if let err = err {
                print(err.localizedDescription)
                return
            }
        }
     }
}
