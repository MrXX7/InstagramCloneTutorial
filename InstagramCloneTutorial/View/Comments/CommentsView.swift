//
//  CommentsView.swift
//  InstagramCloneTutorial
//
//  Created by Oncu Ohancan on 22.05.2022.
//

import SwiftUI

struct CommentsView: View {
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 24) {
                ForEach(0..<10) { _ in
                    CommentsCellView()
                }
            }
        }
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView()
    }
}
