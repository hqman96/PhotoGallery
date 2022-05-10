//
//  NetworkDataFetcher.swift
//  PhotoGallery
//
//  Created by Георгий on 04.05.2022.
//

import Foundation

final class NetworkDataFetcher {
    
    private var networkService = NetworkService()
    
    // MARK: - Search Request Fetch
    
    func fetchImages(searchTerm: String, completion: @escaping (SearchResults?) -> ()) {
        networkService.request(searchTerm: searchTerm) { (data, error) in
            if let error = error {
                print("Error recieved requesting data: \(error.localizedDescription)")
                completion(nil)
            }
            let decode = self.decodeJSON(type: SearchResults.self, from: data)
            completion(decode)
        }
    }
    
    private func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else { return nil }
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let jsonError {
            print("Failed to decode JSON", jsonError)
            return nil
        }
    }
    
    // MARK: - Random Photos Request Fetch
    
    func fetchRandomImages(completion: @escaping ([UnsplashPhoto]?) -> ()) {
        networkService.randomPhotosRequest() { (data, error) in
            if let error = error {
                print("Error recieved requesting data: \(error.localizedDescription)")
                completion(nil)
            }
            let decode = self.decodeJSON(type: [UnsplashPhoto].self, from: data)
            completion(decode)
        }
    }
}
