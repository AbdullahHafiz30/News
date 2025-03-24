//
//  FavoritesManager.swift
//  News
//
//  Created by Abdullah Hafiz on 25/09/1446 AH.
//


import SwiftUI

class FavoritesManager: ObservableObject {
    @Published var favoriteNews: [NewsArticle] = []
    
    func toggleFavorite(_ article: NewsArticle) {
        if let index = favoriteNews.firstIndex(where: { $0.id == article.id }) {
            favoriteNews.remove(at: index)
        } else {
            favoriteNews.append(article)
        }
    }
    
    func isFavorite(_ article: NewsArticle) -> Bool {
        return favoriteNews.contains(where: { $0.id == article.id })
    }
}
