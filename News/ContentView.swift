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
        }
    }
}
struct CustomTabBar: View {
    @Binding var selectedTab: Int?
    let tabIcons = ["house", "chart.line.uptrend.xyaxis", "globe", "books.vertical"]
    var body: some View {
        VStack (spacing: 0) {
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(.separator)
            HStack(spacing: 0) {
                ForEach(tabIcons.indices, id: \.self) { index in
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            selectedTab = index
                        }
                    }) {
                        ZStack {
                            if selectedTab == index {
                                Capsule()
                                    .fill(Color.blue)
                                    .frame(height: 30)
                                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
                                    .animation(.easeInOut(duration: 0.3), value: selectedTab)
                            }
                            Image(systemName: tabIcons[index])
                                .foregroundColor(selectedTab == index ? .white : .gray)
                        }
                        .frame(width: 90, height: 44)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 44)
        }
    }
}

#Preview {
    ContentView()
}
