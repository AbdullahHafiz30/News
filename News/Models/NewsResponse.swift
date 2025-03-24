//
//  NewsResponse.swift
//  News
//
//  Created by Abdullah Hafiz on 25/09/1446 AH.
//


import Foundation

struct NewsResponse: Decodable {
    let status: String
    let totalResults: Int?
    let articles: [NewsArticle]
}
