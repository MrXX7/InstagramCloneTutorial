//
//  FeedView.swift
//  InstagramCloneTutorial
//
//  Created by Oncu Ohancan on 8.05.2022.
//

import SwiftUI

struct FeedView: View {
    
    @ObservedObject var viewModel = FeedViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 32) {
                ForEach(viewModel.posts) { post in
                    FeedCell(post: post)
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
