//
//  Storage.swift
//  PhotoGallery
//
//  Created by Георгий on 08.05.2022.
//

import Foundation

final class Storage {
    
    // MARK: - Singleton
    
    static let shared: Storage = {
        let instance = Storage()
        return instance
    }()
    
    private init() {}
    
    // MARK: - UserDefaults Elements
    
    private let defaults = UserDefaults.standard
    var likedPhotos: [UnsplashPhoto] {
        get {
            if let data = defaults.value(forKey: "likedPhotos") as? Data,
               let objects = try? PropertyListDecoder().decode([UnsplashPhoto].self, from: data) {
                return objects
            } else {
                return [UnsplashPhoto]()
            }
        }
        set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                defaults.set(data, forKey: "likedPhotos")
            }
        }
    }
    
    // MARK: - Functions for saving and deleting objects from UserDefaults
    
    func savePhoto(likedPhoto: UnsplashPhoto) {
        let photo = likedPhoto
        likedPhotos.insert(photo, at: 0)
    }
    
    func deletePhoto(unlikedPhoto: UnsplashPhoto) {
        var subLikedPhotos = likedPhotos
        
        for subLikedPhoto in subLikedPhotos {
            if subLikedPhoto.id == unlikedPhoto.id {
                guard let photoIndex = subLikedPhotos.firstIndex(of: subLikedPhoto) else { return }
                subLikedPhotos.remove(at: photoIndex)
            }
        }
        likedPhotos = subLikedPhotos
    }
}
