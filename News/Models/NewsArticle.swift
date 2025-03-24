//
//  NewsArticle.swift
//  News
//
//  Created by Abdullah Hafiz on 25/09/1446 AH.
//


import Foundation

struct NewsArticle: Decodable, Identifiable {
    // You can generate an ID if not provided; here we use the URL as an identifier if id is nil.
    var id: String? {
        // Use URL as identifier if id is nil
        return _id ?? url
    }
    private let _id: String?
    let source: NewsSource
    let auther: String? // Note: You may want to fix the typo ("author")
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}
