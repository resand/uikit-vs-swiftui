//
//  OnboardingPage.swift
//  SwiftUIExample
//
//  Created by René Sandoval on 29/05/25.
//

import SwiftUI

struct OnboardingPage {
    let title: String
    let description: String
    let imageName: String
}

struct OnboardingPageView: View {
    let page: OnboardingPage

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: page.imageName)
                .font(.system(size: 80))
                .foregroundStyle(.blue)
                .padding(.bottom, 40)

            Text(page.title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)

            Text(page.description)
                .font(.body)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
        }
        .padding(.vertical, 60)
    }
}
