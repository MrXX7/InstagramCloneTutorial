//
//  MessageChatView.swift
//  InstagramCloneTutorial
//
//  Created by Oncu Ohancan on 27.05.2022.
//

import SwiftUI

struct MessageChatView: View {
    @State var message = ""
    @ObservedObject var viewModel: MessagesViewModel
    
    init(userId: String) {
        self.viewModel = MessagesViewModel(userId: userId)
    }
    
    var body: some View {
        VStack {
            ScrollViewReader { scroll in
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.messages) { message in
                    MessageRowView(message: message)
                    }
                }
            }
        }
            MessageInputView(message: $message, action: sendMessage)
                }
        }
    func sendMessage() {
        viewModel.sendMessage(message: message)
        message = ""
        print("Message Sent")
    }
}
