//
//  RegisterView.swift
//  InstagramCloneTutorial
//
//  Created by Oncu Ohancan on 12.05.2022.
//

import SwiftUI

struct RegisterView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            Image("instagram-text-logo")
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(width: 220, height: 220)
                .foregroundColor(.black)
            
            CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                .padding()
                .cornerRadius(10)
                .foregroundColor(.gray)
                .padding(.horizontal, 32)
            CustomSecureField(text: $password, placeholder: Text("Email"), imageName: "envelope")
                .padding()
                .cornerRadius(10)
                .foregroundColor(.gray)
                .padding(.horizontal, 32)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
