//
//  NotificationsView.swift
//  InstagramCloneTutorial
//
//  Created by Oncu Ohancan on 8.05.2022.
//

import SwiftUI

struct NotificationsView: View {
    
    @ObservedObject var viewModel = NotificationViewModel()
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.notifications) { notification in
                    NotificationCell(viewModel: NotificationsCellViewModel(notification: notification))
                        .padding(.top)
                }
            }
        }
    }
}
