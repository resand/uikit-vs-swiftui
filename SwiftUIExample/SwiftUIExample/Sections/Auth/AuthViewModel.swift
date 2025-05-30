//
//  AuthViewModel.swift
//  SwiftUIExample
//
//  Created by René Sandoval on 29/05/25.
//

import SwiftUI

@MainActor
class AuthViewModel: ObservableObject {
    @Published var isAuthenticated = false
    @Published var currentUser: User?

    struct User {
        let id = UUID()
        let name: String
        let email: String
    }

    func login(email: String, password: String) async throws {
        // Simulate network request
        try await Task.sleep(nanoseconds: 1_000_000_000)

        withAnimation {
            currentUser = User(name: "John Doe", email: email)
            isAuthenticated = true
        }
    }

    func register(name: String, email: String, password: String) async throws {
        // Simulate network request
        try await Task.sleep(nanoseconds: 1_000_000_000)

        withAnimation {
            currentUser = User(name: name, email: email)
            isAuthenticated = true
        }
    }

    func logout() {
        withAnimation {
            isAuthenticated = false
            currentUser = nil
        }
    }
}
