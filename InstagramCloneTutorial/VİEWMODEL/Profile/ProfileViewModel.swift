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
        
        ImageUploader.uploadImage(image: image, type: .profile) { imageURL in
            
            Firestore.firestore().collection("users").document(uid).updateData(["profileImageURL": imageURL])
            { err in
                if let err = err {
                    print(err.localizedDescription)
                    return
                }
                self.user.profileImageURL = imageURL
            }
        }
    }
    func follow(uid: String) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        
        Firestore.firestore().collection("following").document(currentUid).collection("user-following").document(uid).setData([:]) { (err) in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            Firestore.firestore().collection("followers").document(uid).collection("user-followers").document(uid).setData([:]) { (err) in
                if let err = err {
                    print(err.localizedDescription)
                    return
                }
            }
        }
    }
}
