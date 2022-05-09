//
//  LikesTableViewController.swift
//  PhotoGallery
//
//  Created by Георгий on 07.05.2022.
//

import UIKit

class LikesTableViewController: UITableViewController {
    
    static let identifier = "LikesTableViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setupNavigationBar()
        tableView.register(LikesTableViewCell.self, forCellReuseIdentifier: "likeCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    private func setupNavigationBar() {
        let titleLabel = UILabel()
        titleLabel.text = "MY COLLECTION"
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        titleLabel.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Base.shared.likedPhotos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "likeCell") as! LikesTableViewCell
        let photo = Base.shared.likedPhotos[indexPath.row]
        cell.configure(with: photo)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = UIStoryboard(name: "Main", bundle: .none).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        navigationController?.pushViewController(detailVC, animated: true)
        let photo = Base.shared.likedPhotos[indexPath.row]
        detailVC.selectedPhoto = photo
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
