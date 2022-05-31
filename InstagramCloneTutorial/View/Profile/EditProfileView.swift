//
//  EditProfileView.swift
//  InstagramCloneTutorial
//
//  Created by Oncu Ohancan on 31.05.2022.
//

import SwiftUI

struct EditProfileView: View {
    
    @State var bio = ""
    
    var body: some View {
        VStack {
            HStack{
                Button(action: {}, label: {
                    Text("Cancel")
                })
                Spacer()
                
                Button(action: {}, label: {
                    Text("Done")
                })
            }.padding()
            TextArea(text: $bio, placeholder: "Add your bio...")
                .frame(width: 370, height: 200)
                .padding()
            
            Spacer()
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
