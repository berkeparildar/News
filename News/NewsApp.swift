//
//  NewsApp.swift
//  News
//
//  Created by Berke Parıldar on 20.06.2024.
//

import SwiftUI

@main
struct NewsApp: App {
    @ObservedObject var locationManager = LocationManager.shared
    
    init () {
        if locationManager.userLocation == nil {
            locationManager.requestLocationAuthorization()
        }
        setupUserDefaults()
    }
    
    private func setupUserDefaults() {
        UserDefaults.standard.register(defaults: [
            UserDefaultKeys.hasSeenOnboarding.rawValue: false,
            UserDefaultKeys.articleCategories.rawValue: ["business" , "sports", "health", "science", "entertainment", "technology"]
        ])
    }
    
    var body: some Scene {
        WindowGroup {
            if locationManager.userLocation == nil {
                EmptyView()
            } else {
                ContentView()
            }
        }
    }
}
