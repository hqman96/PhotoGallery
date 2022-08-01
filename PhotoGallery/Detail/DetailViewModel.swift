//
//  DetailViewModel.swift
//  PhotoGallery
//
//  Created by Георгий on 01.08.2022.
//

import Foundation

protocol DetailViewModelProtocol {
    var selectedPhoto: UnsplashPhoto { get set }
    var photoIsLiked: Bool { get set}
    var photoLikeUpdateHandler: ((Bool) -> Void)? { get set }
    var setupAlert: (() -> Void)? { get set }
    
    func updateLikeStatus()
    func likeButtonTapped()
}

final class DetailViewModel: DetailViewModelProtocol {
    var selectedPhoto: UnsplashPhoto
    var photoLikeUpdateHandler: ((Bool) -> Void)?
    var setupAlert: (() -> Void)?
    
    var photoIsLiked: Bool = false {
        didSet {
            photoLikeUpdateHandler?(photoIsLiked)
        }
    }
    
    init(selectedPhoto: UnsplashPhoto) {
        self.selectedPhoto = selectedPhoto
    }
    
    func updateLikeStatus() {
        photoIsLiked = Storage.shared.likedPhotos.contains(selectedPhoto)
    }
    
    func likeButtonTapped() {
        if photoIsLiked {
            Storage.shared.deletePhoto(unlikedPhoto: selectedPhoto)
            setupAlert?()
        } else {
            Storage.shared.savePhoto(likedPhoto: selectedPhoto)
        }
        photoIsLiked.toggle()
    }
}
