//
//  UploadPostViewModel.swift
//  InstagramCloneTutorial
//
//  Created by Oncu Ohancan on 16.05.2022.
//

import SwiftUI
import Firebase
import FirebaseStorage

class UploadPostViewModel: ObservableObject {
    
    func uploadPost(image: UIImage, caption: String) {
        
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        ImageUploader.uploadImage(image: image, type: .post) { imageURL in
            guard let uid = user.id else { return }
            
            let data = ["caption" : caption,
                        "timestamp" : Timestamp(date: Date()),
                        "likes" : 0,
                        "imageURL" : imageURL,
                        "ownerUid" : uid,
                        "ownerImageURL" : user.profileImageURL,
                        "ownerUsername" : user.username ] as [String: Any]
            
            Firestore.firestore().collection("posts").addDocument(data: data) { err in
                if let err = err {
                    print(err.localizedDescription)
                    return
                }
            }
        }
    }
}
