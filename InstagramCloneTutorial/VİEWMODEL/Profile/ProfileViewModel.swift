//
//  ProfileViewModel.swift
//  InstagramCloneTutorial
//
//  Created by Oncu Ohancan on 15.05.2022.
//

import SwiftUI
import FirebaseStorage
import Firebase

class ProfileViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
    func changeProfileImage(image: UIImage, completion: @escaping(String) -> Void) {
     
        guard let uid = user.id else { return }
        
        ImageUploader.uploadImage(image: image) { imageURL in
            
            Firestore.firestore().collection("users").document(uid).updateData(["profileImageURL": imageURL])
            { err in
                if let err = err {
                    print(err.localizedDescription)
                    return
                }
            }
        }
    }
}
