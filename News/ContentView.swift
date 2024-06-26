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
    private let otherViewC = Text("c")
    
    var body: some View {
        VStack {
            ZStack {
                PersonalFeedView(selectedTab: $selectedTab, selectedCategory: $selectedCategory)
                    .opacity(selectedTab == 0 ? 1 : 0)
                TrendingFeedView()
                    .opacity(selectedTab == 1 ? 1 : 0)
                CategorizedFeedView(selectedCategory: $selectedCategory)
                    .opacity(selectedTab == 2 ? 1 : 0)
                otherViewC
                    .opacity(selectedTab == 3 ? 1 : 0)
            }
            Spacer()
            CustomTabBar(selectedTab: $selectedTab)
                .frame(height: 50)
                .ignoresSafeArea(.keyboard)
        }
        .ignoresSafeArea(.keyboard)
    }
}


#Preview {
    ContentView()
}
