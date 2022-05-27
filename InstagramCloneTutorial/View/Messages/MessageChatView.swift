//
//  MessageChatView.swift
//  InstagramCloneTutorial
//
//  Created by Oncu Ohancan on 27.05.2022.
//

import SwiftUI

struct MessageChatView: View {
    @State var message = ""
    var body: some View {
        VStack {
            MessageInputView(message: $message, action: $sendMessage)
        }
        
    }
    func sendMessage() {
        print("Message Sent")
    }
