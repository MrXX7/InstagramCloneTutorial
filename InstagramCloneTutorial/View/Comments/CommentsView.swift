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
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 24) {
                ForEach(viewModel.comments) { comment in
                    CommentsCellView(comment: comment)
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
