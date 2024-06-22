//
//  ContentView.swift
//  News
//
//  Created by Berke Parıldar on 20.06.2024.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    
    // Initialize views as properties to preserve their states
    private let homeView = HomeView()
    private let otherViewA = Text("a") // Placeholder for your other views
    private let otherViewB = Text("b")
    private let otherViewC = Text("c")
    
    var body: some View {
        VStack {
            // Use opacity to hide and show views instead of removing them from the view hierarchy
            ZStack {
                homeView
                    .opacity(selectedTab == 0 ? 1 : 0)
                otherViewA
                    .opacity(selectedTab == 1 ? 1 : 0)
                otherViewB
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
    @Binding var selectedTab: Int
    let tabIcons = ["house", "magnifyingglass", "heart", "books.vertical"]
    var body: some View {
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
                    .frame(width: 90, height: 44) // Control the size of each tab item
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 44)
    }
}


#Preview {
    ContentView()
}
