//
//  ProfileView.swift
//  InstagramCloneTutorial
//
//  Created by Oncu Ohancan on 8.05.2022.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                ProfileHeaderView(viewModel: ProfileViewModel(user: user))
                    .padding()
                
                PostGridView()
            }
            .padding(.top)
        }
    }
}
