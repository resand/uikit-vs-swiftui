//
//  RegisterView.swift
//  SwiftUIExample
//
//  Created by René Sandoval on 29/05/25.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var isLoading = false
    @State private var showingAlert = false
    @State private var alertMessage = ""

    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("Create Account")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 60)

                VStack(spacing: 16) {
                    TextField("Full Name", text: $name)
                        .textFieldStyle(.roundedBorder)

                    TextField("Email", text: $email)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.emailAddress)

                    SecureField("Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                }
                .padding(.horizontal)

                Button(action: register) {
                    if isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    } else {
                        Text("Register")
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
            }
        }
        .navigationTitle("Register")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Error", isPresented: $showingAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(alertMessage)
        }
    }

    private func register() {
        guard !self.name.isEmpty, !self.email.isEmpty, !self.password.isEmpty else {
            self.alertMessage = "Please fill in all fields"
            self.showingAlert = true
            return
        }

        self.isLoading = true

        Task {
            do {
                try await authViewModel.register(name: name, email: email, password: password)
            } catch {
                alertMessage = "Registration failed"
                showingAlert = true
            }
            isLoading = false
        }
    }
}
