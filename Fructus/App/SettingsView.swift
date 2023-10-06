//
//  SettingsView.swift
//  Fructus
//
//  Created by Micah Hodge on 7/14/23.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTIES
    
    @Environment(\.dismiss) var dismiss
    
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    // MARK: - SECTION 1
                    
                    GroupBox(label: SettingsLabelView(
                        labelText: "Fructus",
                        labelImage: "info.circle"
                    )) {
                        Divider().padding(.vertical, 4)
                        
                        HStack(alignment: .top, spacing: 10) {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(9)
                            
                            Text("Most fruits are naturally low in fat, sodium, and calories. None have cholesterol. Fruits are sources of many essential nutrients, including potassium, dietary fiber, vitamins, and much more.")
                                .font(.footnote)
                        } //: HStack
                    } //: GroupBox
                    
                    // MARK: - SECTION 2
                    
                    GroupBox(label: SettingsLabelView(
                        labelText: "Customization",
                        labelImage: "paintbrush"
                    )) {
                        Divider().padding(.vertical, 4)
                        
                        Text("If you wish, you can restart the application by toggling the switch in this box. That way it starts the onboarding process and you will see the welcome screen again.")
                            .padding(.vertical, 8)
                            .frame(minHeight: 60)
                            .layoutPriority(1)
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                        
                        Toggle(isOn: $isOnboarding) {
                            if isOnboarding {
                                Text("Restarted".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(.green)
                            } else {
                                Text("Restart".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding()
                        .background(
                            Color(UIColor.tertiarySystemBackground)
                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        )
                    } //: GroupBox
                    
                    // MARK: - SECTION 3
                    
                    GroupBox(label: SettingsLabelView(
                        labelText: "Application",
                        labelImage: "apps.iphone"
                    )) {
                        SettingsRowView(name: "Developer", content: "Micah Hodge")
                        
                        SettingsRowView(name: "Designer", content: "Robert Petras")
                        
                        SettingsRowView(name: "Compatibility", content: "iOS 16.4")
                        
                        SettingsRowView(
                            name: "Website",
                            linkLabel: "SwiftUI Masterclass",
                            linkDestination: "swiftuimasterclass.com"
                        )
                        
                        SettingsRowView(
                            name: "Twitter",
                            linkLabel: "@micah__hodge",
                            linkDestination: "twitter.com/micah__hodge"
                        )
                        
                        SettingsRowView(name: "SwiftUI", content: "2.0")
                        
                        SettingsRowView(name: "Version", content: "1.1.0")
                    } //: GroupBox
                } //: VStack
                .navigationTitle("Settings")
                .navigationBarTitleDisplayMode(.large)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "xmark")
                        }
                    }
                }
                .padding()
            } //: ScrollView
        } //: NavigationView
    }
}

// MARK: - PREVIEW

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(.dark)
    }
}
