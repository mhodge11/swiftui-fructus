//
//  SourceLinkView.swift
//  Fructus
//
//  Created by Micah Hodge on 7/14/23.
//

import SwiftUI

struct SourceLinkView: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    
    var body: some View {
        GroupBox() {
            HStack {
                Text("Content source")
                
                Spacer()
                
                Link("Wikipedia", destination: URL(string: "https://wikipedia.com")!)
                
                Image(systemName: "arrow.up.right.square")
            } //: HStack
            .font(.footnote)
        } //: GroupBox
    }
}

// MARK: - PREVIEW

struct SourceLinkView_Previews: PreviewProvider {
    static var previews: some View {
        SourceLinkView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
