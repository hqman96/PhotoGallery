//
//  DetailViewController.swift
//  PhotoGallery
//
//  Created by Георгий on 05.05.2022.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {
    
    var selectedPhoto: UnsplashPhoto!
        var buttonFlag = true
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var authorsNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var downloadsLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        if Base.shared.likedPhotos.contains(selectedPhoto) {
            buttonFlag = false
            self.likeButton.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            self.likeButton.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPhotoImage()
        setupDate()
        setupDownloads()
        authorsNameLabel.text = "Author's name: " + selectedPhoto.user.name
        locationLabel.text = "Location: " + (selectedPhoto.location?.title ?? "None")
    }
    
    @IBAction func likeButton(_ sender: Any) {
        if buttonFlag {
            Base.shared.savePhoto(likedPhoto: selectedPhoto)
            buttonFlag = false
            self.likeButton.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            Base.shared.deletePhoto(unlikedPhoto: selectedPhoto)
            buttonFlag = true
            self.likeButton.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
        }
        
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
}
