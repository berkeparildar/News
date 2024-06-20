//
//  HomeView.swift
//  News
//
//  Created by Berke Parıldar on 20.06.2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    var body: some View {
        NavigationStack {
            switch viewModel.status {
            case .success:
                HeaderView()
                List(viewModel.articles) { item in
                    Text(item.title!)
                }
                .navigationTitle("Items")
            default:
                ProgressView()
            }
        }
        .onAppear(perform: {
            if viewModel.status == .notStarted {
                Task {
                    viewModel.fetchTopArticles()
                }
            }
        })
    }
}

#Preview {
    HomeView()
}
