//
//  FavoritesView.swift
//  News
//
//  Created by Abdullah Hafiz on 25/09/1446 AH.
//


import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favoritesManager: FavoritesManager

    var body: some View {
        NavigationView {
            if favoritesManager.favoriteNews.isEmpty {
                VStack(spacing: 10) {
                    Image(systemName: "heart.slash")
                        .font(.system(size: 50))
                        .foregroundColor(.gray)
                    Text("No Favorites")
                        .font(.headline)
                        .foregroundColor(.gray)
                }
                .padding()
                .navigationTitle("Favorites")
            } else {
                List(favoritesManager.favoriteNews) { article in
                    NavigationLink(destination: NewsDetailView(article: article)) {
                        HStack(spacing: 12) {
                            if let imageUrl = article.urlToImage,
                               let url = URL(string: imageUrl) {
                                AsyncImage(url: url) { phase in
                                    switch phase {
                                    case .empty:
                                        ProgressView()
                                            .frame(width: 60, height: 60)
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 60, height: 60)
                                            .clipShape(RoundedRectangle(cornerRadius: 5))
                                    case .failure:
                                        Image(systemName: "photo")
                                            .frame(width: 60, height: 60)
                                    @unknown default:
                                        EmptyView()
                                    }
                                }
                            } else {
                                Image(systemName: "photo")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 60, height: 60)
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                            }
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(article.title)
                                    .font(.headline)
                                    .lineLimit(2)
                                if let publishedAt = article.publishedAt {
                                    Text(publishedAt)
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                        .padding(.vertical, 8)
                    }
                }
                .navigationTitle("Favorites")
            }
        }
    }
}
