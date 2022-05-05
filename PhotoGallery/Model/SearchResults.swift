//
//  SearchResults.swift
//  PhotoGallery
//
//  Created by Георгий on 04.05.2022.
//

import Foundation

struct SearchResults: Decodable {
    let total: Int
    let results: [UnsplashPhoto]
}

struct UnsplashPhoto: Decodable {
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
struct Location: Decodable {
    let title, name, city, country: String?
}

// MARK: - User
struct User: Decodable {
    let name: String
}