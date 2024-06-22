//
//  NewsCell.swift
//  News
//
//  Created by Berke Parıldar on 21.06.2024.
//

import SwiftUI

struct ArticleCell: View {
    let article: Article
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(article.source.name ?? "")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding(.bottom, 2)
                        .padding(.top, 0)
                    Text(article.title ?? "")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.top, 0)
                Spacer()
                if let imageURL = article.urlToImage {
                    AsyncImage(url: imageURL, content: { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipped()
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(.trailing, 8)
                    }, placeholder: {
                        ProgressView()
                            .frame(width: 100, height: 100)
                    })
                }
            }
            HStack {
                Text("8h")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Spacer()
            }
            .padding(.top, 2)
            Divider()
                .background(.secondary)
                .padding(.top, 4)
        }
    }
}
