//
//  LazyView.swift
//  InstagramCloneTutorial
//
//  Created by Oncu Ohancan on 27.05.2022.
//

import SwiftUI

struct LazyView<Content:View>: View {
    
    let build: () -> Content
    
    init(_ build: @autoclosure @escaping() -> Content) {
        self.build = build
    }
    
    var body : Content { build() }
}
