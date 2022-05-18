//
//  GridViewModel.swift
//  InstagramCloneTutorial
//
//  Created by Oncu Ohancan on 18.05.2022.
//

import SwiftUI
import Firebase

class GridViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    init() {
        fetchPosts()
    }
    
    func fetchPosts() {
        Firestore.firestore().collection("posts").getDocuments { (snap, err ) in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            
            guard let documents = snap?.documents else { return }
            self.posts = documents.compactMap( { try? $0.data(as: Post.self)})
        }
     }
}
