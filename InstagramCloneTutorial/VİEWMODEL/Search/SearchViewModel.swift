//
//  SearchViewModel.swift
//  InstagramCloneTutorial
//
//  Created by Oncu Ohancan on 17.05.2022.
//

import SwiftUI
import Firebase
import FirebaseStorage

class SearchViewModel: ObservableObject {
    
    @Published var users = [User]()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        Firestore.firestore().collection("users").getDocuments { (snap, err) in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            
            guard let documents = snap?.documents else { return }
            self.users = documents.compactMap({ try? $0.data(as: User.self)})
            print(self.users)
        }
    }
    func filterUsers(withText input: String) -> [User] {
        let lowercasedInput = input.lowercased()
        return users.filter({ $0.fullname.lowercased().contains(lowercasedInput) ||
            $0.username.lowercased().contains(lowercasedInput) })
    }
}
