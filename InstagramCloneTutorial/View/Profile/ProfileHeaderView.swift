//
//  ProfileHeaderView.swift
//  InstagramCloneTutorial
//
//  Created by Oncu Ohancan on 12.05.2022.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Image("ted")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .padding(.leading, 16)
                
                Spacer()
                
                HStack(spacing: 16) {
                    UserStats(value: 210, title: "Posts")
                    UserStats(value: 210, title: "Followers")
                    UserStats(value: 210, title: "Following")
                    
                }
            }
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
