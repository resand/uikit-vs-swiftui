//
//  RegisterViewController.swift
//  UIKitExample
//
//  Created by René Sandoval on 29/05/25.
//

import UIKit

class RegisterViewController: UIViewController {
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

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Create Account"
        label.font = .systemFont(ofSize: 34, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Full Name"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupKeyboardObservers()
    }

    private func setupUI() {
        view.backgroundColor = .systemBackground
        title = "Register"

        view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.contentView)

        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.nameTextField)
        self.contentView.addSubview(self.emailTextField)
        self.contentView.addSubview(self.passwordTextField)
        self.contentView.addSubview(self.registerButton)

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

            self.titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 60),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),

            self.nameTextField.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 40),
            self.nameTextField.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            self.nameTextField.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            self.nameTextField.heightAnchor.constraint(equalToConstant: 50),

            self.emailTextField.topAnchor.constraint(equalTo: self.nameTextField.bottomAnchor, constant: 16),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 50),

            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 16),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            self.passwordTextField.heightAnchor.constraint(equalToConstant: 50),

            self.registerButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 30),
            self.registerButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            self.registerButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            self.registerButton.heightAnchor.constraint(equalToConstant: 50),
            self.registerButton.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -20),
        ])

        self.registerButton.addTarget(self, action: #selector(self.registerTapped), for: .touchUpInside)
    }

    private func setupKeyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }

        let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
    }

    @objc private func keyboardWillHide(notification: NSNotification) {
        self.scrollView.contentInset = .zero
        self.scrollView.scrollIndicatorInsets = .zero
    }

    @objc private func registerTapped() {
        // Validate
        guard let name = nameTextField.text, !name.isEmpty,
              let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            self.showAlert(title: "Error", message: "Please fill in all fields")
            return
        }

        // Navigate to Home
        let tabBarController = MainTabBarController()
        navigationController?.setViewControllers([tabBarController], animated: true)
    }

    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
