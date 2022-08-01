//
//  LikesTableViewController.swift
//  PhotoGallery
//
//  Created by Георгий on 07.05.2022.
//

import UIKit

final class LikesTableViewController: UITableViewController {
    
    static let identifier = "LikesTableViewController"
    
    var viewModel: LikesViewModelProtocol!
    var router: LikesRouterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    private func setupTableView() {
        tableView.register(LikesTableViewCell.self, forCellReuseIdentifier: "likeCell")
        tableView.separatorStyle = .none
    }
    
    private func setupNavigationBar() {
        let titleLabel = UILabel()
        titleLabel.text = "MY COLLECTION"
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        titleLabel.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)
    }
    
    // MARK: - Table View Data Source, Table View Delegate
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.likedPhotos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "likeCell") as? LikesTableViewCell else
        { return UITableViewCell() }
        let photo = viewModel.likedPhotos[indexPath.row]
        cell.configure(with: photo)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router.goToDetailsScreen(for: viewModel.likedPhotos[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
