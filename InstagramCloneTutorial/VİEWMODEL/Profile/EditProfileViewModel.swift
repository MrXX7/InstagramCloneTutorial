//
//  EditProfileViewModel.swift
//  InstagramCloneTutorial
//
//  Created by Oncu Ohancan on 31.05.2022.
//

import SwiftUI
import Firebase

class EditProfileViewModel: ObservableObject {
    
    var user: User
    @Published var uploadComplete = false
    
    init(user: User) {
        self.user = user
    }
        
    func saveBio(bio: String) {
        
        guard let userId = user.id else { return }
        Firestore.firestore().collection("users").document(userId).updateData(["bio": bio]) { err in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            self.user.bio = bio
            self.uploadComplete = true
        }
    }
}
