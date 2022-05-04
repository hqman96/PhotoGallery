//
//  NetworkService.swift
//  PhotoGallery
//
//  Created by Георгий on 04.05.2022.
//

import Foundation

class NetworkService {
    
    //построение запроса данных по URL
    func request(searchTerm: String, completion: @escaping (Data?, Error?) -> Void) {
        
        let parameters = self.prepareParameters(searchTerm: searchTerm)
        let url = self.url(params: parameters)
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = prepareHeaders()
        request.httpMethod = "get"
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }
    
    private func prepareHeaders() -> [String:String]? {
        var headers = [String:String]()
        headers["Authorization"] = "Client-ID JOCF05ed5jeFs_wdUSNX_c71ezeRH3xYjp_c-fzgies"
        return headers
    }
    
    private func prepareParameters(searchTerm: String?) -> [String: String] {
        var parameters = [String:String]()
        parameters["query"] = searchTerm
        parameters["page"] = String(1)
        parameters["per_page"] = String(30)
        return parameters
    }
    
    private func url(params: [String: String]) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.unsplash.com"
        components.path = "/search/photos"
        components.queryItems = params.map { URLQueryItem(name: $0, value: $1)}
        return components.url!
    }
    
    private func createDataTask (from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { (data, responce, error) in
            DispatchQueue.main.async {
                completion(data,error)
            }
        }
    }
}