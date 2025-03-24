//
//  NewsDetailView.swift
//  News
//
//  Created by Abdullah Hafiz on 25/09/1446 AH.
//


import SwiftUI

struct NewsDetailView: View {
    let article: NewsArticle
    @EnvironmentObject var favoritesManager: FavoritesManager
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let urlString = article.urlToImage,
                   let url = URL(string: urlString) {
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(height: 200)
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(height: 200)
                                .clipped()
                        case .failure:
                            Image(systemName: "photo")
                                .frame(height: 200)
                        @unknown default:
                            EmptyView()
                        }
                    }
                }
                
                Text(article.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                if let description = article.description {
                    Text(description)
                        .font(.body)
                        .padding(.horizontal)
                }
                
                if let content = article.content {
                    Text(content)
                        .font(.body)
                        .padding(.horizontal)
                }
                
                if let url = URL(string: article.url) {
                    Link("Read Full Article", destination: url)
                        .padding(.horizontal)
                        .padding(.bottom)
                }
            }
            .padding(.vertical)
        }
        .navigationTitle("Article Detail")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button {
                favoritesManager.toggleFavorite(article)
            } label: {
                Image(systemName: favoritesManager.isFavorite(article) ? "heart.fill" : "heart")
                    .foregroundColor(favoritesManager.isFavorite(article) ? .red : .primary)
            }
        }
    }
}


