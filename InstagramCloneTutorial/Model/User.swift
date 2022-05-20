//
//  User.swift
//  InstagramCloneTutorial
//
//  Created by Oncu Ohancan on 15.05.2022.
//

import Firebase
import FirebaseFirestoreSwift

struct User: Decodable, Identifiable {
    let username: String
    let email: String
    let fullname: String
    var profileImageURL: String
    var stats: UserStatsData?
    @DocumentID var id: String?
    
    var isCurrentUser: Bool {
        return AuthViewModel.shared.userSession?.uid == id
    }
    
    var didFollow: Bool? = false
}

struct UserStatsData: Decodable {
    var following: Int
    var followers: Int
    var posts: Int
}
