//
//  DetailViewController.swift
//  PhotoGallery
//
//  Created by Георгий on 05.05.2022.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {
    let identifier = "DetailViewController"
    var selectedPhoto: UnsplashPhoto!
        

  
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var authorsNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var downloadsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPhotoImage()
        setupDate()
        setupDownloads()
        authorsNameLabel.text = "Author's name: " + selectedPhoto.user.name
        locationLabel.text = "Location: " + (selectedPhoto.location?.title ?? "None")
        print(selectedPhoto.location.customMirror)
        print(selectedPhoto.location?.name ?? "123")
        print(selectedPhoto.location?.title ?? "456")


    }
    
    private func setupPhotoImage() {
        let photoUrl = selectedPhoto.urls["regular"]
        guard let imageUrl = photoUrl, let url = URL(string: imageUrl) else { return }
        photoImageView.sd_setImage(with: url, completed: nil)
        photoImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
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
