//
//  PhotosCollectionViewModel.swift
//  PhotoGallery
//
//  Created by Георгий on 01.08.2022.
//

import Foundation

protocol PhotosCollectionViewModelProtocol {
    var photos: [UnsplashPhoto] { get }
    var photosUpdateHandler: (() -> Void)? { get set }
    
    func getRandomPhotos()
    func fetchImages(searchTerm: String)
}

final class PhotosCollectionViewModel: PhotosCollectionViewModelProtocol {
    
    private var networkDataFetcher = NetworkDataFetcher()
    
    var photos = [UnsplashPhoto]() {
        didSet {
            photosUpdateHandler?()
        }
    }
    
    var photosUpdateHandler: (() -> Void)?
    
    func getRandomPhotos() {
        networkDataFetcher.fetchRandomImages { [weak self] photos in
            guard let loadedPhotos = photos else { return }
            self?.photos = loadedPhotos
        }
    }
    
    func fetchImages(searchTerm: String) {
        networkDataFetcher.fetchImages(searchTerm: searchTerm) { [weak self] (searchResults) in
            guard let fetchedPhotos = searchResults else { return }
            self?.photos = fetchedPhotos.results
        }
    }
}
