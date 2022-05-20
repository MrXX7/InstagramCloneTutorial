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
        checkFollow()
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
    
    func follow() {
        guard let userId = user.id else { return }
        
        UserService.follow(uid: userId) { (err) in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            self.user.didFollow = true
        }
    }
    
    func unfollow() {
        guard let userId = user.id else { return }
        
        UserService.unfollow(uid: userId) { (err) in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            self.user.didFollow = false
        }
    }
    
    func checkFollow() {
        guard let userId = user.id else { return }
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        
        Firestore.firestore().collection("following").document(currentUid).collection("user-following").document(userId).getDocument { (snap, err) in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            guard let didFollow = snap?.exists else { return }
        }
    }
}
