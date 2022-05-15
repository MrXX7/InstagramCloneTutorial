//
//  AuthViewModel.swift
//  InstagramCloneTutorial
//
//  Created by Oncu Ohancan on 14.05.2022.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    
    @Published var userSession: Firebase.User?
    
    static let shared = AuthViewModel()
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, err) in
            if let err = err {
                print(err.localizedDescription)
                return
                 }
            guard let user = result?.user else { return }
            self.userSession = user
            }
    }
    
    
    func register(withEmail email: String, password: String, username: String, fullname: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
        if let err = err {
            print(err.localizedDescription)
            return
        }
        guard let user = result?.user else { return }
        
            let data = ["email": email,
                        "username": username,
                        "fullname": fullname,
                        "uid": user.uid]
            Firestore.firestore().collection("users").addDocument(data: data) { err in
                if let err = err {
                    print(err.localizedDescription)
                    return
                }
                print("DEBUG: USER CREATED")
            }
        }
    }
}
