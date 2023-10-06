//
//  SettingsRowView.swift
//  Fructus
//
//  Created by Micah Hodge on 7/14/23.
//

import SwiftUI

struct SettingsRowView: View {
    // MARK: - PROPERTIES
    
    var name: String
    var content: String? = nil
    var linkLabel: String? = nil
    var linkDestination: String? = nil
    
    // MARK: - BODY
    
    var body: some View {
        VStack {
            Divider().padding(.vertical, 4)
            
            HStack {
                Text(name)
                    .foregroundColor(.gray)
                
                Spacer()
                
                if content != nil {
                    Text(content!)
                } else if linkLabel != nil && linkDestination != nil {
                    Link(linkLabel!, destination: URL(string: "https://\(linkDestination!)")!)
                    
                    Image(systemName: "arrow.up.right.square")
                        .foregroundColor(.pink)
                } else {
                    EmptyView()
                }
            } //: HStack
        } //: VStack
    }
}

// MARK: - PREVIEW

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRowView(name: "Developer", content: "John / Jane")
            .previewLayout(.fixed(width: 375, height: 60))
            .padding()
        
        SettingsRowView(name: "Website", linkLabel: "SwiftUI Masterclass", linkDestination: "swiftuimasterclass.com")
            .previewLayout(.fixed(width: 375, height: 60))
            .padding()
    }
}
