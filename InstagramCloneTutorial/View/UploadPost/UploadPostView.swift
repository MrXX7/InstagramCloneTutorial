//
//  UploadPostView.swift
//  InstagramCloneTutorial
//
//  Created by Oncu Ohancan on 8.05.2022.
//

import SwiftUI

struct UploadPostView: View {
    
    
    @State private var selectedImage: UIImage?
    @State var postImage: Image
    @State var captionText = ""
    
    var body: some View {
        Image(systemName: "plus.circle")
            .resizable()
            .scaledToFill()
            .frame(width: 100, height: 100)
            .clipped()
            .padding(.top)
            .foregroundColor(.black)
    }
}
