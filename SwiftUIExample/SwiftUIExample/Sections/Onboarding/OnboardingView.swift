import SwiftUI

struct OnboardingView: View {
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = false
    @State private var currentPage = 0

    let pages = [
        OnboardingPage(
            title: "Welcome to Our App",
            description: "Discover amazing features that will enhance your experience",
            imageName: "star.fill"
        ),
        OnboardingPage(
            title: "Stay Connected",
            description: "Connect with friends and share your moments",
            imageName: "person.2.fill"
        ),
        OnboardingPage(
            title: "Get Started",
            description: "Join us today and start your journey",
            imageName: "checkmark.circle.fill"
        ),
    ]

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(currentPage == pages.count - 1 ? "Get Started" : "Skip") {
                    completeOnboarding()
                }
                .padding()
            }

            TabView(selection: $currentPage) {
                ForEach(0..<pages.count, id: \.self) { index in
                    OnboardingPageView(page: pages[index])
                        .tag(index)
                }
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))

            Spacer()
        }
    }

    private func completeOnboarding() {
        withAnimation {
            hasCompletedOnboarding = true
        }
    }
}
