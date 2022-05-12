//
//  SignInView.swift
//  InstagramCloneTutorial
//
//  Created by Oncu Ohancan on 12.05.2022.
//

import SwiftUI

struct SignInView: View {
    
    @State var email = ""
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
                CustomSecureField(text: $password, placeholder: Text("Password"), imageName: "envelope")
                    .padding()
                    .padding(.horizontal, 32)
            }
                
                HStack {
                    Spacer()
                    NavigationLink(destination: ForgotPasswordView(), label: {
                        Text("Forgot Password")
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundColor(.gray)
                            .padding(.top)
                            .padding(.trailing, 28)
                    })
                }.padding(.horizontal, 24)
                
                Button(action: {}, label: {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 50)
                        .background(.blue)
                        .clipShape(Capsule())
                        .padding()
                })
                Spacer()
                
                NavigationLink(destination: RegisterView(), label: {
                    HStack {
                        Text("Don't have an account?")
                            .font(.system(size: 14, weight: .semibold))
                        Text("Sign Up")
                            .font(.system(size: 14))
                        }
                })
            }.padding(.top, -100)
            }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
