//
//  SearchView.swift
//  InstagramCloneTutorial
//
//  Created by Oncu Ohancan on 8.05.2022.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    @State var inSearchMode = false
    var body: some View {
        SearchBar(text: $searchText, isEditing: $inSearchMode)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
