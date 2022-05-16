//
//  ImageUploader.swift
//  InstagramCloneTutorial
//
//  Created by Oncu Ohancan on 16.05.2022.
//

import SwiftUI
import FirebaseStorage
import Firebase

enum UploadType {
    case profile
    case post
}

struct ImageUploader {
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        ref.putData(imageData, metadata: nil) { (_, err ) in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            ref.downloadURL { (url, err) in
                if let err = err {
                    print(err.localizedDescription)
                    return
                }
                guard let imageURL = url?.absoluteString else { return }
                completion(imageURL)
            }
        }
    }
}
