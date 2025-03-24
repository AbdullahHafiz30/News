# NewsApp

NewsApp is a multi‑screen SwiftUI news application that demonstrates key iOS development concepts such as networking with URLSession and Alamofire, MVVM architecture, pagination, and favorites management. This project is intended for learning purposes only.

## Features

- **Latest News Feed:** Fetch and display news articles from the News API.
- **Pagination:** Dynamically load more articles as the user scrolls.
- **Article Details:** Tap on an article to view detailed content and a link to read the full story.
- **Favorites Management:** Mark articles as favorites and manage them in a dedicated favorites view.
- **Settings:** Toggle between Dark Mode and Light Mode.

## Project Structure

The project is organized into the following folders:

- **Models:**  
  Contains data models such as `Article.swift`, `NewsResponse.swift`, and `Source.swift`.
  
- **Network:**  
  Contains networking code in `NetworkManager.swift` to handle API calls using URLSession and Alamofire.
  
- **Utils:**  
  Contains utility files such as `PlistReader.swift` for reading configuration values from the Info.plist.
  
- **ViewModels:**  
  Contains view models like `NewsViewModel.swift` that manage app state and data fetching.
  
- **Managers:**  
  Contains managers such as `FavoritesManager.swift` for handling favorite articles.
  
- **Views:**  
  Contains all the SwiftUI views including `HomeView.swift`, `NewsDetailView.swift`, `FavoritesView.swift`, `MainTabView.swift`, and `SettingsView.swift`.

## Installation

1. **Clone the Repository:**  
   Clone the project from your GitHub repository.

2. **Open in Xcode:**  
   Open the project file (`NewsApp.xcodeproj`) in Xcode.

3. **Dependencies:**  
   Ensure Alamofire is added via Swift Package Manager (or your preferred dependency manager).

4. **API Key Configuration:**  
   In the `Info.plist` file, replace the placeholder API key with your own News API key.

5. **Build and Run:**  
   Build the project and run it on your simulator or device.

## Usage

- **Home Screen:**  
  The Home screen displays the latest news articles. Scroll down to load more articles.
  
- **Article Detail:**  
  Tap an article to navigate to the detail view. Here you can read the full article content and tap a link to view the original source in your browser.
  
- **Favorites:**  
  Use the heart button on the article detail view to mark an article as a favorite. Access your favorites in the Favorites tab.
  
- **Settings:**  
  Use the Settings tab to toggle between Dark Mode and Light Mode.

## License

This project is provided for learning purposes only. You are free to use, modify, and distribute this code for educational use. No warranty is provided.
