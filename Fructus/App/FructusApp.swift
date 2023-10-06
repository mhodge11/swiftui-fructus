//
//  FructusApp.swift
//  Fructus
//
//  Created by Micah Hodge on 7/14/23.
//

import SwiftUI

@main
struct FructusApp: App {
    // MARK: - PROPERTIES
    
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    // MARK: - BODY
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardingView()
            } else {
                ContentView()
            }
        }
    }
}
