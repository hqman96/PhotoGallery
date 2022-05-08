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
       
        tableView.register(LikesTableViewCell.self, forCellReuseIdentifier: "likeCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
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
}
