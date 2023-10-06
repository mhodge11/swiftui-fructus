//
//  ContentView.swift
//  Fructus
//
//  Created by Micah Hodge on 7/14/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    var fruits: [Fruit] = fruitsData
    
    @State private var isShowingSettings: Bool = false
    
    // MARK: - BODY
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(fruits.sorted(by: { fruit1, fruit2 in
                    return fruit1.title < fruit2.title
                })) { fruit in
                    NavigationLink(destination: FruitDetailView(fruit: fruit)) {
                        FruitRowView(fruit: fruit)
                            .padding(.vertical, 4)
                    } //: NavigationLink
                } //: ForEach
            } //: List
            .navigationTitle("Fruits")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isShowingSettings = true
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    } //: Button
                    .sheet(isPresented: $isShowingSettings) {
                        SettingsView()
                    }
                } //: ToolbarItem
            } //: Toolbar
        } //: NavigationStack
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fruits: fruitsData)
    }
}
