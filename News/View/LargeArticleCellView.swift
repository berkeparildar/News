//
//  LargeArticleCellView.swift
//  News
//
//  Created by Berke Parıldar on 25.06.2024.
//

import SwiftUI

struct LargeArticleCellView: View {
    let article: Article
    var body: some View {
            VStack {
                if let imageURL = article.urlToImage {
                    AsyncImage(url: imageURL, content: { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .clipped()
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }, placeholder: {
                        ProgressView()
                            .frame(width: 100, height: 100)
                    })
                }
                HStack {
                    VStack(alignment: .leading) {
                        Text(article.source.name ?? "")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .padding(.vertical, 2)
                        Text(article.title?.cutAfterLast(occurrenceOf: "-") ?? "")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.bottom, 2)
                        HStack {
                            Text(article.publishedAt.flatMap(Date.from(iso8601String:))?.timeAgoDisplay() ?? "recently")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            Spacer()
                        }
                    }
                    Spacer()
                }
            }
    }
}
