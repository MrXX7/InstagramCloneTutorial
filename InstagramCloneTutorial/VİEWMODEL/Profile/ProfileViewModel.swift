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
    func changeProfileImage(image: UIImage, completion: @escaping(String)-> Void) {
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
                
                guard let uid = self.user.id else { return }
                
                Firestore.firestore().collection("users").document(uid).updateData(["profileImageURL": imageURL]) { err in
                    if let err = err {
                        print(err.localizedDescription)
                        return
                    }
                }
            }
        }
    }
}
