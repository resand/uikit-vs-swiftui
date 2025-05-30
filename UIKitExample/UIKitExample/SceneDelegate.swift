//
//  SceneDelegate.swift
//  UIKitExample
//
//  Created by René Sandoval on 28/05/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)

        // Check if user has completed onboarding
        let hasCompletedOnboarding = UserDefaults.standard.bool(forKey: "hasCompletedOnboarding")

        if hasCompletedOnboarding {
            let loginVC = LoginViewController()
            let navController = UINavigationController(rootViewController: loginVC)
            window?.rootViewController = navController
        } else {
            window?.rootViewController = OnboardingViewController()
        }

        window?.makeKeyAndVisible()
    }
}
