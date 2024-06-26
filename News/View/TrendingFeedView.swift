//
//  TrendingFeedView.swift
//  News
//
//  Created by Berke Parıldar on 25.06.2024.
//

import SwiftUI

struct TrendingFeedView: View {
    var body: some View {
        NavigationStack {
            ArticleListView(viewModel: ArticleListViewModel(fetchCategory: .all), isSmallCell: true)
                .navigationTitle("Top Stories")
                .toolbarTitleDisplayMode(.inline)
                .toolbarBackground(.background, for: .navigationBar)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: {
                            ArticleSearchView()
                        }, label: {
                            Image(systemName: "magnifyingglass")
                                .foregroundStyle(.foreground)
                                .font(.subheadline)
                        })
                    }
                }
        }
        
    }
}

#Preview {
    TrendingFeedView()
}
