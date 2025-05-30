//
//  MainTabBarController.swift
//  UIKitExample
//
//  Created by René Sandoval on 29/05/25.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewControllers()
    }

    private func setupViewControllers() {
        let homeVC = HomeViewController()
        let homeNav = UINavigationController(rootViewController: homeVC)
        homeNav.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)

        let profileVC = ProfileViewController()
        let profileNav = UINavigationController(rootViewController: profileVC)
        profileNav.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), tag: 1)

        viewControllers = [homeNav, profileNav]
    }
}
