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
        self.viewModel = MessagesViewModel(user: user)
    }
    
    var body: some View {
        VStack {
            MessageInputView(message: $message, action: sendMessage)
        }
        
    }
    func sendMessage() {
        viewModel.sendMessage(message: message)
        message = ""
        print("Message Sent")
    }
}
