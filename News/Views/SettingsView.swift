//
//  SettingView.swift
//  News
//
//  Created by Abdullah Hafiz on 23/09/1446 AH.
//

import SwiftUI

struct SettingsView: View {
    @State var isDarkMode: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Toggle(isDarkMode ? "Light Mode" :"Dark Mode", isOn: $isDarkMode)
                    .padding()
            }
            .preferredColorScheme(isDarkMode ? .dark : .light)
            .navigationTitle("Setting")
        }
    }
}


#Preview {
    SettingsView()
}
