//
//  ContentView.swift
//  News
//
//  Created by Berke Parıldar on 20.06.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            Text("Settings Tab")
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
            
            Text("Profile Tab")
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

#Preview {
    ContentView()
}
