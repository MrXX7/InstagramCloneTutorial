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
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        ref.putData(imageData, metadata: nil) { (_, err ) in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            ref .downloadURL { (url, err) in
                if let err = err {
                    print(err.localizedDescription)
                    return
                }
                guard let imageURL = url?.absoluteString else { return }
                
                guard let uid = user.id else { return }
                
                let data = ["caption" : caption,
                            "timestamp" : Timestamp(date: Date()),
                            "likes" : 0,
                            "imageURL" : imageURL,
                            "ownerUid" : user.id,
                            "ownerImageURL" : user.profileImageURL,
                            "ownerUsername" : user.username ] as [String : Any]
                
                Firestore.firestore().collection("posts").addDocument(data: data) { err in
                    if let err = err {
                        print(err.localizedDescription)
                        return
                    }
                }
            }
        }
    }
}
