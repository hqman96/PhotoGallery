//
//  DetailViewController.swift
//  PhotoGallery
//
//  Created by Георгий on 05.05.2022.
//

import UIKit
import SDWebImage

final class DetailViewController: UIViewController {
    
    var selectedPhoto: UnsplashPhoto!
    private var photoIsLiked = false {
        didSet {
            if photoIsLiked {
                self.likeButton.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
            } else {
                self.likeButton.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
            }
        }
    }
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var authorsNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var downloadsLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        photoIsLiked = Storage.shared.likedPhotos.contains(selectedPhoto)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPhotoImage()
        setupDate()
        setupDownloads()
        authorsNameLabel.text = "Author's name: " + selectedPhoto.user.name
        locationLabel.text = "Location: " + (selectedPhoto.location?.title ?? "None")
    }
    
    @IBAction func likeButtonTapped(_ sender: Any) {
        if photoIsLiked {
            Storage.shared.deletePhoto(unlikedPhoto: selectedPhoto)
            setupAlert()
        } else {
            Storage.shared.savePhoto(likedPhoto: selectedPhoto)
        }
        photoIsLiked.toggle()
    }
    
    // MARK: - Setup UI Elements' Data
    
    private func setupPhotoImage() {
        let photoUrl = selectedPhoto.urls["regular"]
        guard let imageUrl = photoUrl, let url = URL(string: imageUrl) else { return }
        photoImageView.sd_setImage(with: url, completed: nil)
    }
    
    private func setupDate() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd, yyyy"
        
        if let date = dateFormatter.date(from: selectedPhoto.createdAt) {
            dateLabel.text = "Created at: " + dateFormatterPrint.string(from: date)
        } else {
            dateLabel.text = "Created at: None"
        }
    }
    
    private func setupDownloads() {
        if let downloads = selectedPhoto.downloads {
            downloadsLabel.text = "Downloads: " + String(describing: downloads)
        } else {
            downloadsLabel.text = "Downloads: None"
        }
    }
    
    private func setupAlert() {
        let unlikeAlertController = UIAlertController(title: "", message: "This photo has been removed from your collection.", preferredStyle: .alert)
        let unlikeAlertAction = UIAlertAction(title: "Okay", style: .default, handler: .none)
        unlikeAlertController.addAction(unlikeAlertAction)
        self.present(unlikeAlertController, animated: true, completion: nil)
    }
}
