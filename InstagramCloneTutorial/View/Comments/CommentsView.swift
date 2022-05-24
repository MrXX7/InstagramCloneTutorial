//
//  CommentsView.swift
//  InstagramCloneTutorial
//
//  Created by Oncu Ohancan on 22.05.2022.
//

import SwiftUI

struct CommentsView: View {
    
    @State var comment = ""
    @ObservedObject var viewModel: CommentsViewModel
    
    
    init(post: Post) {
        self.viewModel = CommentsViewModel(post: post)
    }
    
    var body: some View {
        VStack {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 24) {
                ForEach(0..<10) { _ in
                    CommentsCellView()
                }
            }
        }
        CommentInputView(inputText: $comment, action: uploadComment)
    }
}

func uploadComment() {
    viewModel.uploadComment(comment: comment)
    self.comment = ""
    }
}
