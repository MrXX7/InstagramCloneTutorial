//
//  CommentsViewModel.swift
//  InstagramCloneTutorial
//
//  Created by Oncu Ohancan on 24.05.2022.
//

import SwiftUI
import Firebase

class CommentsViewModel: ObservableObject {
    
    let post: Post
    
    init(post: Post) {
        self.post = post
    }
    
    func uploadComment(comment: String) {
    
        guard let postID = post.id else { return }
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let userID = user.id else { return }
        
        var data: [String: Any] = [ "comment" : comment,
                                    "uid" : userID,
                                    "timestamp" : Timestamp(date: Date()),
                                    "postOwnerId" : post.ownerUid,
                                    "username" : user.username,
                                    "profileImageURL" : user.profileImageURL]
        
        Firestore.firestore().collection("posts").document(postID).collection("post-comments").addDocument(data: data) { (err) in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            NotificationViewModel.sendNotification(withUid: self.post.ownerUid, type: .comment, post: self.post)
        }
    }
}
