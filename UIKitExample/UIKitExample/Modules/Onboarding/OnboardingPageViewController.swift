import UIKit

class OnboardingPageViewController: UIViewController {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemBlue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    init(title: String, description: String, imageName: String) {
        super.init(nibName: nil, bundle: nil)
        self.titleLabel.text = title
        self.descriptionLabel.text = description
        self.imageView.image = UIImage(systemName: imageName)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .systemBackground

        view.addSubview(self.imageView)
        view.addSubview(self.titleLabel)
        view.addSubview(self.descriptionLabel)

        NSLayoutConstraint.activate([
            self.imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            self.imageView.widthAnchor.constraint(equalToConstant: 120),
            self.imageView.heightAnchor.constraint(equalToConstant: 120),

            self.titleLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 40),
            self.titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            self.titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),

            self.descriptionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 16),
            self.descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            self.descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
        ])
    }
}
