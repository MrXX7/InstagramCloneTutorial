//
//  UserService.swift
//  InstagramCloneTutorial
//
//  Created by Oncu Ohancan on 20.05.2022.
//

import SwiftUI
import Firebase

struct UserService {
    func follow(uid: String, completion: ((Error?) -> Void)?) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        
        Firestore.firestore().collection("following").document(currentUid).collection("user-following").document(uid).setData([:]) { (err) in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            Firestore.firestore().collection("followers").document(uid).collection("user-followers").document(currentUid).setData([:], completion: completion)
                }
            }
    static func unfollow(uid: String, completion: ((Error?) -> Void)?) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        Firestore.firestore().collection("following").document(currentUid).collection("user-following").document(uid).delete { (err) in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            Firestore.firestore().collection("followers").document(uid).collection("user-followers").document(currentUid).setData([:], completion: completion)
            }
        }
}
