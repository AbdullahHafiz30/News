//
//  NewsApp.swift
//  News
//
//  Created by Abdullah Hafiz on 23/09/1446 AH.
//

import SwiftUI

@main
struct NewsApp: App {
    @StateObject private var favoritesManager = FavoritesManager()
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(favoritesManager)
        }
    }
}

