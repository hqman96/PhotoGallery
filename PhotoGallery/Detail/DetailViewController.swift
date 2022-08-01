//
//  DetailViewController.swift
//  PhotoGallery
//
//  Created by Георгий on 05.05.2022.
//

import UIKit
import SDWebImage

final class DetailViewController: UIViewController {
    
    var viewModel: DetailViewModelProtocol!
        
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var authorsNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var downloadsLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.updateLikeStatus()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPhotoImage()
        setupDate()
        setupDownloads()
        authorsNameLabel.text = "Author's name: " + viewModel.selectedPhoto.user.name
        locationLabel.text = "Location: " + (viewModel.selectedPhoto.location?.title ?? "N/A")
        bindViewModel()
    }
    
    @IBAction func likeButtonTapped(_ sender: Any) {
        viewModel.likeButtonTapped()
    }
    
    // MARK: - Setup UI Elements' Data
    
    private func setupPhotoImage() {
        let photoUrl = viewModel.selectedPhoto.urls["regular"]
        guard let imageUrl = photoUrl, let url = URL(string: imageUrl) else { return }
        photoImageView.sd_setImage(with: url, completed: nil)
    }
    
    private func setupDate() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd, yyyy"
        
        if let date = dateFormatter.date(from: viewModel.selectedPhoto.createdAt) {
            dateLabel.text = "Created at: " + dateFormatterPrint.string(from: date)
        } else {
            dateLabel.text = "Created at: None"
        }
    }
    
    private func setupDownloads() {
        if let downloads = viewModel.selectedPhoto.downloads {
            downloadsLabel.text = "Downloads: " + String(describing: downloads)
        } else {
            downloadsLabel.text = "Downloads: N/A"
        }
    }
    
    // MARK: - Other
    func bindViewModel() {
        viewModel.photoLikeUpdateHandler = { [weak self] isLiked in
            if isLiked {
                self?.likeButton.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
            } else {
                self?.likeButton.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
            }
        }
        
        viewModel.setupAlert = { [weak self] in
            let unlikeAlertController = UIAlertController(title: "", message: "This photo has been removed from your collection.", preferredStyle: .alert)
            let unlikeAlertAction = UIAlertAction(title: "Okay", style: .default, handler: .none)
            unlikeAlertController.addAction(unlikeAlertAction)
            self?.present(unlikeAlertController, animated: true, completion: nil)
        }
    }
}
