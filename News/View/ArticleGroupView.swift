//
//  ArticleGroupView.swift
//  News
//
//  Created by Berke Parıldar on 23.06.2024.
//

import SwiftUI

struct ArticleGroupView: View {
    var articles: [Article]
    var body: some View {
        ForEach(0..<articles.count, id: \.self) { index in
            ZStack {
                NavigationLink(destination: ArticleDetailView(url: articles[index].url!)) {
                    EmptyView()
                }
                .opacity(0)
                ArticleCell(article: articles[index])
            }
            .listRowSeparator(.hidden)
        }
        .listRowSeparator(.hidden)
        .listRowSpacing(0)
    }
}

