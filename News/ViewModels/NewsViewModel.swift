//
//  NewsViewModel.swift
//  News
//
//  Created by Abdullah Hafiz on 25/09/1446 AH.
//


import SwiftUI

class NewsViewModel: ObservableObject {
    @Published var articles: [NewsArticle] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private var currentPage = 1
    private let pageSize = 10
    private var isEndOfList = false
    
    private let query: String
    private let apiKey: String
    private let useAlamofire: Bool
    
    init(query: String, apiKey: String, useAlamofire: Bool = false) {
        self.query = query
        self.apiKey = apiKey
        self.useAlamofire = useAlamofire
    }
    
    func fetchNews() {
        // Prevent duplicate calls
        guard !isLoading, !isEndOfList else { return }
        
        isLoading = true
        errorMessage = nil
        
        let service = NetworkManager.shared
        
        let completionHandler: (Result<NewsResponse, Error>) -> Void = { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                self.isLoading = false
                
                switch result {
                case .success(let response):
                    self.articles.append(contentsOf: response.articles)
                    
                    if response.articles.count < self.pageSize {
                        self.isEndOfList = true
                    } else {
                        self.currentPage += 1
                    }
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
        
        if useAlamofire {
            service.fetchNewsAlamofire(
                query: query,
                page: currentPage,
                pageSize: pageSize,
                apiKey: apiKey,
                completion: completionHandler
            )
        } else {
            service.fetchNewsURLSession(
                query: query,
                page: currentPage,
                pageSize: pageSize,
                apiKey: apiKey,
                completion: completionHandler
            )
        }
    }
    
    // Called when a row is near the bottom to load more
    func loadMoreIfNeeded(currentItem item: NewsArticle) {
        guard let itemIndex = articles.firstIndex(where: { $0.id == item.id }) else { return }
        let thresholdIndex = articles.index(articles.endIndex, offsetBy: -3)
        if itemIndex >= thresholdIndex {
            fetchNews()
        }
    }
}
