//
//  ProfileView.swift
//  InstagramCloneTutorial
//
//  Created by Oncu Ohancan on 8.05.2022.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                ProfileHeaderView()
                    .padding()
                
                PostGridView()
            }
            .padding(.top)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
