//
//  ProfileView.swift
//  SwiftUIExample
//
//  Created by René Sandoval on 29/05/25.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = false
    @State private var showingEditProfile = false

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Profile Image
                Image(systemName: "person.circle.fill")
                    .font(.system(size: 100))
                    .foregroundStyle(.gray)
                    .padding(.top, 40)

                // User Info
                VStack(spacing: 8) {
                    Text(authViewModel.currentUser?.name ?? "John Doe")
                        .font(.title2)
                        .fontWeight(.bold)

                    Text(authViewModel.currentUser?.email ?? "john.doe@example.com")
                        .font(.body)
                        .foregroundStyle(.secondary)
                }
                .padding(.vertical)

                // Buttons
                VStack(spacing: 16) {
                    Button(action: { showingEditProfile = true }) {
                        Text("Edit Profile")
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color.blue)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }

                    Button(action: logout) {
                        Text("Logout")
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color.red)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                .padding(.horizontal)
                .padding(.top, 20)
            }
        }
        .navigationTitle("Profile")
        .sheet(isPresented: $showingEditProfile) {
            EditProfileView()
        }
    }

    private func logout() {
        self.hasCompletedOnboarding = false
        self.authViewModel.logout()
    }
}
