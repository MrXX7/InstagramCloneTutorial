//
//  MessagesViewModel.swift
//  InstagramCloneTutorial
//
//  Created by Oncu Ohancan on 27.05.2022.
//

import SwiftUI
import Firebase

class MessagesViewModel: ObservableObject{
    
    @Published var messages = [Message]()
    
    let currentUserID: String
    
    init(userId: String) {
        self.currentUserID = userId
        fetchMessages(withUid: currentUserID)
    }
    
    func fetchMessages(withUid currentProfileId: String) {
        
        guard let currentUserId = AuthViewModel.shared.userSession?.uid else { return }
        
        Firestore.firestore().collection("messages").document(currentUserId).collection("user-messages").document(currentProfileId).collection("messages").addSnapshotListener{ (snap, err) in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            guard let document = snap?.documentChanges.filter({ $0.type == .added}) else { return }
            self.messages.append(contentsOf: document.compactMap({ try? $0.document.data(as: Message.self)}))
        }
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
