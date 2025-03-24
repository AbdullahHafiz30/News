//
//  PlistReader.swift
//  News
//
//  Created by Abdullah Hafiz on 25/09/1446 AH.
//

import Foundation

enum PlistReader {
    static func value(forKey key: String) -> String? {
        guard let url = Bundle.main.url(forResource: "Info", withExtension: "plist"),
              let data = try? Data(contentsOf: url)
        else {
            print("❌ Could not find Info.plist")
            return nil
        }
        
        do {
            if let plist = try PropertyListSerialization.propertyList(
                from: data,
                options: [],
                format: nil
            ) as? [String: Any] {
                return plist[key] as? String
            }
        } catch {
            print("❌ Error reading Info.plist: \(error)")
        }
        
        return nil
    }
}
