//
//  CategorizedFeedView.swift
//  News
//
//  Created by Berke Parıldar on 23.06.2024.
//

import SwiftUI

struct CategorizedFeedView: View {
    private let categories = ["business", ]
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading) {
                        ForEach(categories) { category in
                            VStack(alignment: .leading) {
                                Text(category.name)
                                    .font(.headline)
                                    .padding(.leading, 15)
                                    .padding(.top, 5)

                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 10) {
                                        ForEach(category.articles) { article in
                                            ArticleView(article: article)
                                        }
                                    }
                                    .padding(.leading, 15)
                                }
                            }
                            .padding(.bottom, 10)
                        }
                    }
                }
                .navigationTitle("Headlines")
    }
}
/*
#Preview {
    CategorizedFeedView()
}
*/
