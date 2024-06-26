//
//  ContentView.swift
//  News
//
//  Created by Berke Parıldar on 20.06.2024.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Int? = 0
    @State private var selectedCategory: Int? = 0
    @State private var hasSeenOnBoarding: Bool
    
    init() {
        self.hasSeenOnBoarding = UserDefaults.standard.bool(forKey: "hasSeenOnboarding")
    }
    
    var body: some View {
        if hasSeenOnBoarding {
            VStack {
                ZStack {
                    PersonalFeedView(selectedTab: $selectedTab, selectedCategory: $selectedCategory)
                        .opacity(selectedTab == 0 ? 1 : 0)
                    TrendingFeedView()
                        .opacity(selectedTab == 1 ? 1 : 0)
                    CategorizedFeedView(selectedCategory: $selectedCategory)
                        .opacity(selectedTab == 2 ? 1 : 0)
                }
                Spacer()
                CustomTabBar(selectedTab: $selectedTab)
                    .frame(height: 50)
                    .ignoresSafeArea(.keyboard)
            }
            .ignoresSafeArea(.keyboard)
        } else {
            OnBoardingView(hasSeenOnboaring: $hasSeenOnBoarding)
        }
        
    }
}


#Preview {
    ContentView()
}
