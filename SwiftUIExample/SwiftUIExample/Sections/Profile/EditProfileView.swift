//
//  EditProfileView.swift
//  SwiftUIExample
//
//  Created by René Sandoval on 29/05/25.
//

import SwiftUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var name = ""
    @State private var email = ""

    var body: some View {
        NavigationStack {
            Form {
                Section("Personal Information") {
                    TextField("Name", text: $name)
                    TextField("Email", text: $email)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.emailAddress)
                }
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        // Save changes
                        dismiss()
                    }
                    .fontWeight(.semibold)
                }
            }
            .onAppear {
                name = authViewModel.currentUser?.name ?? ""
                email = authViewModel.currentUser?.email ?? ""
            }
        }
    }
}
