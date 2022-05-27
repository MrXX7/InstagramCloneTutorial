//
//  MessagesViewModel.swift
//  InstagramCloneTutorial
//
//  Created by Oncu Ohancan on 27.05.2022.
//

import SwiftUI
import Firebase

class MessagesViewModel: ObservableObject {
    
    let user: User
    
    init(user: User) {
        self.user = user
    }
    
    func sendMessage(message: String) {
        
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        guard let userId = AuthViewModel.shared.userSession?.uid else { return }
        
        guard let receiverId = user.id else { return }
        
        var data: [String: Any] = ["uid" : userId,
                                   "receiverId" : receiverId,
                                   "message" : message,
                                   "timestamp" : Timestamp(date: Date()),
                                   "ownerImageURL" :user.profileImageURL]
 
        Firestore.firestore().collection("messages").document(userId).collection("user-messages").document(receiverId).collection("messages").addDocument(data: data) { (err) in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            
            Firestore.firestore().collection("messages").document(receiverId).collection("user-messages").document(userId).collection("messages").addDocument(data: data) { (err) in
                if let err = err {
                    print(err.localizedDescription)
                    return
                }
            }
        }
    }
}
