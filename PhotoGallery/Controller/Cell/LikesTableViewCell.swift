//
//  LikesTableViewCell.swift
//  PhotoGallery
//
//  Created by Георгий on 07.05.2022.
//

import UIKit
import SDWebImage

final class LikesTableViewCell: UITableViewCell {
    static let identifier = "likeCell"
    
   private let photoImageView: UIImageView = {
        let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFit
    imageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        return imageView
    }()
    
    private let authorsNameLabel: UILabel = {
        let authorsNameLabel = UILabel()
        authorsNameLabel.translatesAutoresizingMaskIntoConstraints = false
        authorsNameLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        return authorsNameLabel
    }()
    
    private var unsplashPhoto: UnsplashPhoto!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(authorsNameLabel)
        contentView.addSubview(photoImageView)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            photoImageView.widthAnchor.constraint(equalToConstant: 50),
            photoImageView.heightAnchor.constraint(equalToConstant: 50),
            
            authorsNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 23),
            authorsNameLabel.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: 10),
            authorsNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            
            contentView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func configure(with photo: UnsplashPhoto) {
        authorsNameLabel.text = photo.user.name
        let photoUrl = photo.urls["small"]
        guard let imageUrl = photoUrl, let url = URL(string: imageUrl) else { return }
        photoImageView.sd_setImage(with: url, completed: nil)
    }
}
