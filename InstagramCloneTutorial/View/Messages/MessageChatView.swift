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
    
    init(user: User) {
        self.viewModel = MessagesViewModel(userId: userId)
    }
    
    var body: some View {
        VStack {
            MessageInputView(message: $message, action: sendMessage)
                .onAppear{
                    print(viewModel.messages)
                }
        }
        
    }
    func sendMessage() {
        viewModel.sendMessage(message: message)
        message = ""
        print("Message Sent")
    }
}
