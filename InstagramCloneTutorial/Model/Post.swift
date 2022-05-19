//
//  Post.swift
//  InstagramCloneTutorial
//
//  Created by Oncu Ohancan on 16.05.2022.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct Post: Identifiable, Decodable {
    @DocumentID var id: String?
    let ownerUid: String
    let ownerUsername: String
    let caption: String
    let likes: Int
    let imageURL: String
    let timestamp: Timestamp
    let ownerImageURL: String
    
    var user: User?
    var didLike: Bool? = false
}
