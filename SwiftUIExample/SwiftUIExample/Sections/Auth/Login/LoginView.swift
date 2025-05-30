//
//  LoginView.swift
//  SwiftUIExample
//
//  Created by René Sandoval on 29/05/25.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var email = ""
    @State private var password = ""
    @State private var isLoading = false
    @State private var showingAlert = false
    @State private var alertMessage = ""

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 30) {
                    Text("Welcome Back")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 60)

                    VStack(spacing: 16) {
                        TextField("Email", text: $email)
                            .textFieldStyle(.roundedBorder)
                            .textInputAutocapitalization(.never)
                            .keyboardType(.emailAddress)

                        SecureField("Password", text: $password)
                            .textFieldStyle(.roundedBorder)
                    }
                    .padding(.horizontal)

                    Button(action: login) {
                        if isLoading {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        } else {
                            Text("Login")
                                .fontWeight(.semibold)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.blue)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(.horizontal)
                    .disabled(isLoading)

                    NavigationLink {
                        RegisterView()
                    } label: {
                        Text("Don't have an account? Register")
                            .foregroundStyle(.blue)
                    }
                }
            }
            .alert("Error", isPresented: $showingAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(alertMessage)
            }
        }
    }

    private func login() {
        guard !self.email.isEmpty, !self.password.isEmpty else {
            self.alertMessage = "Please fill in all fields"
            self.showingAlert = true
            return
        }

        self.isLoading = true

        Task {
            do {
                try await authViewModel.login(email: email, password: password)
            } catch {
                alertMessage = "Login failed"
                showingAlert = true
            }
            isLoading = false
        }
    }
}
