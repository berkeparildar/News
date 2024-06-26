//
//  ArticleSearchView.swift
//  News
//
//  Created by Berke Parıldar on 26.06.2024.
//

import SwiftUI

struct ArticleSearchView: View {
    @StateObject var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ArticleGroupView(articles: viewModel.articles, isSmallCell: true)
            }
            .listStyle(.plain)
            .searchable(text: $viewModel.searchText)
            .navigationTitle("Search Articles")
        .navigationBarTitleDisplayMode(.inline)
        }
    }
    
}

#Preview {
    ArticleSearchView()
}
