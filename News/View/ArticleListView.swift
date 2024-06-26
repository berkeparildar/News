//
//  HomeView.swift
//  News
//
//  Created by Berke Parıldar on 20.06.2024.
//

import SwiftUI

struct ArticleListView: View {
    @StateObject var viewModel: ArticleListViewModel
    let isSmallCell: Bool
    var body: some View {
        NavigationStack {
            switch viewModel.status {
            case .success:
                List {
                    ArticleGroupView(articles: viewModel.topArticles, isSmallCell: isSmallCell)
                    ProgressView()
                        .onAppear(perform: {
                            viewModel.fetchArticles()
                        })
                }
                .listStyle(.plain)
            default:
                ProgressView()
            }
        }
        .onAppear {
            if viewModel.status == .notStarted {
                Task {
                    viewModel.fetchArticles()
                }
            }
        }
    }
}
