//
//  HomeView.swift
//  News
//
//  Created by Berke Parıldar on 20.06.2024.
//

import SwiftUI

struct ArticleListView: View {
    @StateObject var viewModel: ArticleListViewModel
    var body: some View {
        NavigationStack {
            switch viewModel.status {
            case .success:
                List {
                    ArticleGroupView(articles: viewModel.topArticles)
                    ProgressView()
                        .onAppear(perform: {
                            viewModel.fetchArticles()
                        })
                }
                .listRowSpacing(0)
                .listStyle(.plain)
                .navigationBarTitleDisplayMode(.inline)
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
