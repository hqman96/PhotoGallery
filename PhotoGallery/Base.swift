//
//  Base.swift
//  PhotoGallery
//
//  Created by Георгий on 08.05.2022.
//

import Foundation

class Base {
    
    let defaults = UserDefaults.standard
    static let shared = Base()
    var likedPhotos: [UnsplashPhoto] {
        
        get {
            if let data = defaults.value(forKey: "likedPhotos") as? Data {
                return try! PropertyListDecoder().decode([UnsplashPhoto].self, from: data)
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
    
    func savePhoto(likedPhoto: UnsplashPhoto) {
        let photo = likedPhoto
        likedPhotos.insert(photo, at: 0)
    }
}