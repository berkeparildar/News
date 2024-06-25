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
        }
    }
}

#Preview {
    TrendingFeedView()
}
