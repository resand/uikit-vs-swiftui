//
//  SwiftUIExampleApp.swift
//  SwiftUIExample
//
//  Created by René Sandoval on 28/05/25.
//

import SwiftUI

@main
struct SwiftUIExampleApp: App {
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = false
     @StateObject private var authViewModel = AuthViewModel()

     var body: some Scene {
         WindowGroup {
             if hasCompletedOnboarding {
                 if authViewModel.isAuthenticated {
                     MainTabView()
                         .environmentObject(authViewModel)
                 } else {
                     LoginView()
                         .environmentObject(authViewModel)
                 }
             } else {
                 OnboardingView()
             }
         }
     }
}
