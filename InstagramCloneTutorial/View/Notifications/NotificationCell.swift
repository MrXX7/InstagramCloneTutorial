//
//  NotificationCell.swift
//  InstagramCloneTutorial
//
//  Created by Oncu Ohancan on 11.05.2022.
//

import SwiftUI
import Kingfisher

struct NotificationCell: View {
    
    @ObservedObject var viewModel: NotificationsCellViewModel
    
    init(viewModel: NotificationsCellViewModel) {
        self.viewModel = viewModel
    }
    
    var didFollow: Bool {
        return viewModel.notification.didFollow ?? false
    }
    
    var body: some View {
        HStack {
            if let user = viewModel.notification.user {
                NavigationLink(destination: ProfileView(user: user)) {
                    if let imageURL = viewModel.notification.profileImageURL {
                            KFImage(URL(string: imageURL))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                        }
                        
                        Text(viewModel.notification.username)
                            .font(.system(size: 14, weight: .semibold))
                        +
                        Text(viewModel.notification.type.notificationsMessage)
                            .font(.system(size: 15))
                        +
                        Text(viewModel.timestamp)
                            .foregroundColor(.gray)
                            .font(.system(size: 12))
                }
            }
            
            Spacer()
                
                if viewModel.notification.type == .follow {
                    
                    Button {
                        didFollow ? viewModel.unfollow() : viewModel.follow()
                        }
                        label: {
                            Text(didFollow ? "Following" : "Follow")
                            .font(.system(size: 14, weight: .semibold))
                            .frame(width: 100, height: 32)
                            .foregroundColor(didFollow ? .black : .white)
                            .background(didFollow ? Color.white : Color.blue)
                            .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: didFollow ? 1 : 0)
                            )
                        }.cornerRadius(3)
                }
                else {
                    if let post = viewModel.notification.post {
                        NavigationLink(destination: FeedCell(viewModel: FeedCellViewModel(post: post))) {
                        KFImage(URL(string: post.imageURL))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipped()
                    }
                }
            }
        }.padding(.horizontal)
    }
}
