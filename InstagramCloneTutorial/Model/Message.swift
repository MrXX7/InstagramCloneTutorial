//
//  Message.swift
//  InstagramCloneTutorial
//
//  Created by Oncu Ohancan on 27.05.2022.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct Message: Identifiable, Decodable {
    @DocumentID var id: String?
    let message: String
    let receiverId: String
    let ownerImageURL: String
    let timestamp: Timestamp
    let uid: String
}
