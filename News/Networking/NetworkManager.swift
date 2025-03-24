//
//  NetworkManager.swift
//  News
//
//  Created by Abdullah Hafiz on 25/09/1446 AH.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    private let baseURL = "https://newsapi.org/v2/everything"
    
    // MARK: - URLSession Method
    func fetchNewsURLSession(
        query: String,
        page: Int,
        pageSize: Int,
        apiKey: String,
        completion: @escaping (Result<NewsResponse, Error>) -> Void
    ) {
        var components = URLComponents(string: baseURL)!
        components.queryItems = [
            URLQueryItem(name: "q", value: query),
            URLQueryItem(name: "page", value: String(page)),
            URLQueryItem(name: "pageSize", value: String(pageSize)),
            URLQueryItem(name: "apiKey", value: apiKey)
        ]
        
        guard let url = components.url else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(NewsResponse.self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
    // MARK: - Alamofire Method
    func fetchNewsAlamofire(
        query: String,
        page: Int,
        pageSize: Int,
        apiKey: String,
        completion: @escaping (Result<NewsResponse, Error>) -> Void
    ) {
        let parameters: [String: Any] = [
            "q": query,
            "page": page,
            "pageSize": pageSize,
            "apiKey": apiKey
        ]
        
        AF.request(baseURL, method: .get, parameters: parameters)
            .validate()
            .responseDecodable(of: NewsResponse.self) { response in
                switch response.result {
                case .success(let newsResponse):
                    completion(.success(newsResponse))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
