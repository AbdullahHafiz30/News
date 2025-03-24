//
//  HomeView.swift
//  News
//
//  Created by Abdullah Hafiz on 23/09/1446 AH.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = NewsViewModel(
        query: "tesla",
        apiKey: PlistReader.value(forKey: "API_KEY") ?? ""
    )
    
    @EnvironmentObject var favoritesManager: FavoritesManager
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.articles) { article in
                    NavigationLink(destination: NewsDetailView(article: article)) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(article.title)
                                .font(.headline)
                                .lineLimit(2)
                            if let description = article.description {
                                Text(description)
                                    .font(.subheadline)
                                    .lineLimit(2)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.vertical, 8)
                    }
                    .onAppear {
                        viewModel.loadMoreIfNeeded(currentItem: article)
                    }
                }
                
                if viewModel.isLoading {
                    HStack {
                        Spacer()
                        ProgressView()
                        Spacer()
                    }
                }
            }
            .navigationTitle("Latest News")
            .onAppear {
                viewModel.fetchNews()
            }
            .alert(isPresented: Binding<Bool>(
                get: { viewModel.errorMessage != nil },
                set: { _ in viewModel.errorMessage = nil }
            )) {
                Alert(
                    title: Text("Error"),
                    message: Text(viewModel.errorMessage ?? "Unknown error"),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
}


#Preview {
    HomeView()
}
