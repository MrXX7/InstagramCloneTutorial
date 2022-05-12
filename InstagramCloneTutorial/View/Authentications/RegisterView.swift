//
//  RegisterView.swift
//  InstagramCloneTutorial
//
//  Created by Oncu Ohancan on 12.05.2022.
//

import SwiftUI

struct RegisterView: View {
    
    @State var email = ""
    @State var username = ""
    @State var fullname = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
        VStack {
            Image("instagram-text-logo")
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(width: 220, height: 220)
                .foregroundColor(.black)
            
            VStack(spacing: -16) {
            CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                .padding()
                .padding(.horizontal, 32)
                
            CustomTextField(text: $username, placeholder: Text("Username"), imageName: "person")
                    .padding()
                    .padding(.horizontal, 32)
                
            CustomTextField(text: $fullname, placeholder: Text("Fullname"), imageName: "person")
                    .padding()
                    .padding(.horizontal, 32)
            
            CustomSecureField(text: $password, placeholder: Text("Password"), imageName: "envelope")
                .padding()
                .padding(.horizontal, 32)
        }
            Button(action: {}, label: {
                Text("Register")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 360, height: 50)
                    .background(.blue)
                    .clipShape(Capsule())
                    .padding()
            })
            Spacer()
            
            NavigationLink(destination: SignInView().navigationBarHidden(true), label: {
                HStack {
                    Text("Already have an account?")
                        .font(.system(size: 14, weight: .semibold))
                    Text("Sign In")
                        .font(.system(size: 14))
                    }
            })
        }.padding(.top, -110)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
