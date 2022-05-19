//
//  FeedCellViewModel.swift
//  InstagramCloneTutorial
//
//  Created by Oncu Ohancan on 19.05.2022.
//

import SwiftUI
import Firebase

class FeedCellViewModel: ObservableObject {
    @Published var post: Post
    
    init(post: Post) {
        self.post = post
        fetchUser()
    }
    
    func fetchUser() {
        Firestore.firestore().collection("users").document(post.ownerUid).getDocument { (snap, err) in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            self.post.user = try? snap?.data(as: User.self)
        }
    }
    
    func like() {
        
        guard let postUid = post.id else { return }
        guard let userID = AuthViewModel.shared.userSession?.uid else { return }
        
        Firestore.firestore().collection("posts").document(postUid).collection("post-likes").document(userID).setData([:]) { (err) in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            
            Firestore.firestore().collection("users").document(userID).collection("user-likes").document(postUid).setData([:]) { (err) in
                if let err = err {
                    print(err.localizedDescription)
                    return
                }
                Firestore.firestore().collection("posts").document(postUid).updateData(["likes": self.post.likes + 1]) { (err) in
                    if let err = err {
                        print(err.localizedDescription)
                        return
                    }
                    self.post.likes += 1
                    self.post.didLike = true
                 }
             }
        }
    }
    
    func unlike() {
        
    }
}
