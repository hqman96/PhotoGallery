//
//  LikesViewModel.swift
//  PhotoGallery
//
//  Created by Георгий on 01.08.2022.
//

import Foundation

protocol LikesViewModelProtocol {
    var likedPhotos: [UnsplashPhoto] { get }
}

final class LikesViewModel: LikesViewModelProtocol {
    
    var likedPhotos: [UnsplashPhoto] {
        return Storage.shared.likedPhotos
    }
}
