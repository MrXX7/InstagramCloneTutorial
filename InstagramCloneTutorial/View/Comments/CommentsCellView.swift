//
//  CommentsCellView.swift
//  InstagramCloneTutorial
//
//  Created by Oncu Ohancan on 22.05.2022.
//

import SwiftUI

struct CommentsCellView: View {
    var body: some View {
        HStack {
            Image("ted")
                .resizable()
                .scaledToFill()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
                
            HStack {
                Text("tedmosby")
                    .font(.system(size: 14,weight: .semibold))
                +
                Text(" Post Comment")
                    .font(.system(size: 14))
                
                Spacer()
                
                Text("2H")
                    .foregroundColor(.gray)
                    .font(.system(size: 12))
                    .padding(.trailing)
            }
        }.padding(.horizontal)
    }
}

struct CommentsCellView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsCellView()
    }
}
