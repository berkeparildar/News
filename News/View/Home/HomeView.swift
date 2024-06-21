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
                List {
                    HeaderView()
                    GroupTitle(titleText: "Top stories")
                    ArticleGroup(viewModel: viewModel)
                    ProgressView()
                        .onAppear(perform: {
                            viewModel.fetchTopArticles()
                        })
                }
                .listRowSpacing(0)
                .listStyle(.plain)
                .navigationTitle("News")
                .navigationBarTitleDisplayMode(.inline)
            default:
                ProgressView()
            }
        }
        .onAppear {
            if viewModel.status == .notStarted {
                Task {
                    viewModel.fetchTopArticles()
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
