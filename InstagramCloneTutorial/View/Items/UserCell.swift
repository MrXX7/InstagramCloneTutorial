//
//  UserCell.swift
//  InstagramCloneTutorial
//
//  Created by Oncu Ohancan on 11.05.2022.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            Image("ted")
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipped()
                .clipShape(Circle())
            VStack {
                Text("tedmosby")
                    .font(.system(size: 14, weight: .semibold))
                Text("Ted Mosby")
                    .font(.system(size: 14))
            }
            Spacer()
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
