//
//  UserListView.swift
//  InstagramCloneTutorial
//
//  Created by Oncu Ohancan on 11.05.2022.
//

import SwiftUI

struct UserListView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<10) { _ in
                    UserCell()
                }
            }
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
