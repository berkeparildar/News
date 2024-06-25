//
//  ArticleGroupView.swift
//  News
//
//  Created by Berke Parıldar on 23.06.2024.
//

import SwiftUI

struct ArticleGroupView: View {
    var articles: [Article]
    var isSmallCell: Bool
    var body: some View {
        ForEach(0..<articles.count, id: \.self) { index in
            ZStack {
                NavigationLink(destination: ArticleDetailView(url: articles[index].url!)) {
                    EmptyView()
                }
                .opacity(0)
                if isSmallCell {
                    SmallArticleCellView(article: articles[index])
                        .listRowSeparator(.hidden)
                } else {
                    LargeArticleCellView(article: articles[index])
                        .listRowSeparator(.visible)
                }
            }
        }
        .listRowSpacing(0)
    }
}

