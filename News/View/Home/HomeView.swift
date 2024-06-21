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
                ScrollView {
                    HeaderView()
                    ForEach(viewModel.articles) { article in
                        NewsCell(article: article)
                    }
                }
                .navigationTitle("News")
                .navigationBarTitleDisplayMode(.inline)
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
