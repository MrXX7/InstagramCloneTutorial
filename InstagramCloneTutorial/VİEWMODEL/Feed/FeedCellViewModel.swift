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
}
