//
//  NotificationCell.swift
//  InstagramCloneTutorial
//
//  Created by Oncu Ohancan on 11.05.2022.
//

import SwiftUI
import Kingfisher

struct NotificationCell: View {
    
    let notification: Notification
    var body: some View {
        HStack {
            if let imageURL = notification.profileImageURL {
                KFImage(URL(string: imageURL))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
            }
            
            Text(notification.username)
                .font(.system(size: 14, weight: .semibold))
            +
            Text(" has followed you.")
                .font(.system(size: 15))
            +
            Text(" 2H")
                .foregroundColor(.gray)
                .font(.system(size: 12))
            
            Spacer()
            
            Text("Follow")
                .font(.system(size: 14, weight: .semibold))
                .frame(width: 100, height: 32)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(3)
                .overlay(
                    RoundedRectangle(cornerRadius: 3)
                        .stroke(Color.gray, lineWidth: 1)
            )
        }
        .padding(.horizontal)
    }
}
