//
//  InstagramCloneTutorialApp.swift
//  InstagramCloneTutorial
//
//  Created by Oncu Ohancan on 8.05.2022.
//

import SwiftUI
import Firebase

@main
struct InstagramCloneTutorialApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {

        WindowGroup {
            ContentView().environmentObject(AuthViewModel.shared)
        }
    }
}
