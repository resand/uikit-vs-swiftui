//
//  HomeViewController.swift
//  UIKitExample
//
//  Created by René Sandoval on 29/05/25.
//

import UIKit

class HomeViewController: UIViewController {
    private var items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    private let refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .systemBackground
        title = "Home"

        view.addSubview(self.tableView)

        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])

        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        // Setup refresh control
        self.refreshControl.addTarget(self, action: #selector(self.refreshData), for: .valueChanged)
        self.tableView.refreshControl = self.refreshControl
    }

    @objc private func refreshData() {
        // Simulate network request
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.items.append("New Item \(Int.random(in: 6...100))")
            self?.tableView.reloadData()
            self?.refreshControl.endRefreshing()
        }
    }
}

// MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = self.items[indexPath.row]
        return cell
    }
}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
