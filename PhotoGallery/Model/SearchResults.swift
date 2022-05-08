//
//  SearchResults.swift
//  PhotoGallery
//
//  Created by Георгий on 04.05.2022.
//

import Foundation

struct SearchResults: Codable {
    let total: Int
    let results: [UnsplashPhoto]
}

struct UnsplashPhoto: Codable {
    let id: String
    let createdAt: String
    let user: User
    let location: Location?
    let downloads: Int?
    let width: Int
    let height: Int
    let urls: [URLKing.RawValue: String]
    
    enum URLKing: String {
        case raw
        case full
        case regular
        case small
        case thumb
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case user
        case location
        case downloads
        case width
        case height
        case urls
    }
}

// MARK: - Location
struct Location: Codable {
    let title: String?
}

// MARK: - User
struct User: Codable {
    let name: String
}

extension UnsplashPhoto: Equatable {
    static func == (lhs: UnsplashPhoto, rhs: UnsplashPhoto) -> Bool {
        return lhs.id == rhs.id &&
            lhs.createdAt == rhs.createdAt &&
            lhs.user.name == rhs.user.name &&
            lhs.location?.title == rhs.location?.title &&
            lhs.downloads == rhs.downloads &&
            lhs.width == rhs.width &&
            lhs.height == rhs.height &&
            lhs.urls == rhs.urls
    }
}
