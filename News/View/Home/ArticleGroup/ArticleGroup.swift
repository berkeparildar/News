//
//  ArticleGroup.swift
//  News
//
//  Created by Berke Parıldar on 21.06.2024.
//

import SwiftUI

struct ArticleGroup: View {
    @StateObject var viewModel: HomeViewModel
    var body: some View {
        ForEach(0..<viewModel.topArticles.count, id: \.self) { index in
            ZStack {
                NavigationLink(destination: ArticleDetailView(url: viewModel.topArticles[index].url!)) {
                    EmptyView()
                }
                .opacity(0)
                ArticleCell(article: viewModel.topArticles[index])
            }
            .listRowSeparator(.hidden)
        }
        .listRowSeparator(.hidden)
        .listRowSpacing(0)
    }
}
