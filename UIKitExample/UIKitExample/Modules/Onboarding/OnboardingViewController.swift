import UIKit

class OnboardingViewController: UIViewController {
    private let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    private var pages: [UIViewController] = []
    private var currentPage = 0

    private let pageControl: UIPageControl = {
        let control = UIPageControl()
        control.currentPageIndicatorTintColor = .systemBlue
        control.pageIndicatorTintColor = .systemGray3
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()

    private let skipButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Skip", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .medium)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupPages()
        self.setupUI()
    }

    private func setupPages() {
        let page1 = OnboardingPageViewController(
            title: "Welcome to Our App",
            description: "Discover amazing features that will enhance your experience",
            imageName: "star.fill"
        )

        let page2 = OnboardingPageViewController(
            title: "Stay Connected",
            description: "Connect with friends and share your moments",
            imageName: "person.2.fill"
        )

        let page3 = OnboardingPageViewController(
            title: "Get Started",
            description: "Join us today and start your journey",
            imageName: "checkmark.circle.fill"
        )

        self.pages = [page1, page2, page3]
        self.pageControl.numberOfPages = self.pages.count
    }

    private func setupUI() {
        view.backgroundColor = .systemBackground

        // Add page view controller
        addChild(self.pageViewController)
        view.addSubview(self.pageViewController.view)
        self.pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        self.pageViewController.didMove(toParent: self)

        // Set data source and delegate
        self.pageViewController.dataSource = self
        self.pageViewController.delegate = self

        // Set initial page
        if let firstPage = pages.first {
            self.pageViewController.setViewControllers([firstPage], direction: .forward, animated: false)
        }

        // Add page control and skip button
        view.addSubview(self.pageControl)
        view.addSubview(self.skipButton)

        // Setup constraints
        NSLayoutConstraint.activate([
            self.pageViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            self.pageViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.pageViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            self.pageViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            self.pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            self.pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            self.skipButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.skipButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])

        self.skipButton.addTarget(self, action: #selector(self.skipTapped), for: .touchUpInside)
    }

    @objc private func skipTapped() {
        self.completeOnboarding()
    }

    private func completeOnboarding() {
        UserDefaults.standard.set(true, forKey: "hasCompletedOnboarding")

        let loginVC = LoginViewController()
        let navController = UINavigationController(rootViewController: loginVC)

        if let windowScene = view.window?.windowScene,
           let sceneDelegate = windowScene.delegate as? SceneDelegate {
            sceneDelegate.window?.rootViewController = navController
        }
    }
}

// MARK: - UIPageViewControllerDataSource

extension OnboardingViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index > 0 else { return nil }
        return self.pages[index - 1]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index < pages.count - 1 else { return nil }
        return self.pages[index + 1]
    }
}

// MARK: - UIPageViewControllerDelegate
extension OnboardingViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed,
           let currentVC = pageViewController.viewControllers?.first,
           let index = pages.firstIndex(of: currentVC) {
            currentPage = index
            pageControl.currentPage = index

            // If on last page, change skip button to "Get Started"
            if index == pages.count - 1 {
                skipButton.setTitle("Get Started", for: .normal)
            } else {
                skipButton.setTitle("Skip", for: .normal)
            }
        }
    }
}
