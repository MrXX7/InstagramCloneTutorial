//
//  ProfileHeaderView.swift
//  InstagramCloneTutorial
//
//  Created by Oncu Ohancan on 12.05.2022.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    
    @State var selectedImage: UIImage?
    @State var userImage: Image?
    @State var imagePickerRepresented = false
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                ZStack {
                    if let imageURL = viewModel.user.profileImageURL {
                        KFImage(URL(string: imageURL))
                            .resizable()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                            .padding(.leading, 16)
                }
                    else {
                        Button(action: {
                            self.imagePickerRepresented.toggle()
                        }, label: {
                            Image("profile-placeholder")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                                .padding(.leading, 16)
                        }).sheet(isPresented: $imagePickerRepresented, onDismiss: loadImage, content: {
                            ImagePicker(image: $selectedImage)
                        })
                    }
                }
                
                
                Spacer()
                
                HStack(spacing: 16) {
                    UserStats(value: 210, title: "Posts")
                    UserStats(value: 210, title: "Followers")
                    UserStats(value: 210, title: "Following")
                }.padding(.trailing, 32)
            }
            Text(viewModel.user.fullname ?? "")
                .font(.system(size: 15, weight: .bold))
                .padding([.leading, .top])
            }
        }
    }
    extension ProfileHeaderView {
        func loadImage() {
            guard let selectedImage = selectedImage else { return }
            viewModel.changeProfileImage(image: selectedImage) { (_) in
                print("DEBUG: Uploaded Image")
            }
       }
}
