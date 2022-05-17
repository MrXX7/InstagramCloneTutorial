//
//  UserListView.swift
//  InstagramCloneTutorial
//
//  Created by Oncu Ohancan on 11.05.2022.
//

import SwiftUI

struct UserListView: View {
    
    @ObservedObject var viewModel: SearchViewModel
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.users) { user in
                    UserCell()
                        .padding(.leading, 8)
                }
            }
        }
    }
}

