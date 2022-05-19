//
//  PostGridView.swift
//  InstagramCloneTutorial
//
//  Created by Oncu Ohancan on 9.05.2022.
//

import SwiftUI
import Kingfisher

struct PostGridView: View {
    
    private let items = [GridItem(), GridItem(), GridItem()]
    private let width = UIScreen.main.bounds.width / 3
    let config: PostGridConfig
    @ObservedObject var viewModel: GridViewModel
    
    init(config: PostGridConfig) {
        self.config = config
        self.viewModel = GridViewModel(config: config)
    }
    
    var body: some View {
        LazyVGrid(columns: items, spacing: 2, content: {
            ForEach(viewModel.posts) { post in
                KFImage(URL(string: post.imageURL))
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: width)
                    .clipped()
                
            }
        }) .padding(.horizontal)
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView()
    }
}
