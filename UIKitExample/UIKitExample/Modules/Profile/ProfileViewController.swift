//
//  ProfileViewController.swift
//  UIKitExample
//
//  Created by René Sandoval on 29/05/25.
//

import UIKit

class ProfileViewController: UIViewController {
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray3
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "John Doe"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "john.doe@example.com"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let editButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Edit Profile", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Logout", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        button.backgroundColor = .systemRed
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .systemBackground
        title = "Profile"

        view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.contentView)

        self.contentView.addSubview(self.profileImageView)
        self.contentView.addSubview(self.nameLabel)
        self.contentView.addSubview(self.emailLabel)
        self.contentView.addSubview(self.editButton)
        self.contentView.addSubview(self.logoutButton)

        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            self.contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            self.contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            self.contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            self.contentView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),

            self.profileImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 40),
            self.profileImageView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            self.profileImageView.widthAnchor.constraint(equalToConstant: 100),
            self.profileImageView.heightAnchor.constraint(equalToConstant: 100),

            self.nameLabel.topAnchor.constraint(equalTo: self.profileImageView.bottomAnchor, constant: 20),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            self.nameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),

            self.emailLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 8),
            self.emailLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            self.emailLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),

            self.editButton.topAnchor.constraint(equalTo: self.emailLabel.bottomAnchor, constant: 40),
            self.editButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            self.editButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            self.editButton.heightAnchor.constraint(equalToConstant: 50),

            self.logoutButton.topAnchor.constraint(equalTo: self.editButton.bottomAnchor, constant: 16),
            self.logoutButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            self.logoutButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            self.logoutButton.heightAnchor.constraint(equalToConstant: 50),
            self.logoutButton.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -40),
        ])

        self.editButton.addTarget(self, action: #selector(self.editProfileTapped), for: .touchUpInside)
        self.logoutButton.addTarget(self, action: #selector(self.logoutTapped), for: .touchUpInside)
    }

    @objc private func editProfileTapped() {
        // Handle edit profile
    }

    @objc private func logoutTapped() {
        UserDefaults.standard.set(false, forKey: "hasCompletedOnboarding")

        let loginVC = LoginViewController()
        let navController = UINavigationController(rootViewController: loginVC)

        if let windowScene = view.window?.windowScene,
           let sceneDelegate = windowScene.delegate as? SceneDelegate {
            sceneDelegate.window?.rootViewController = navController
        }
    }
}
