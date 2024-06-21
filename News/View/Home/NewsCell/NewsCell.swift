//
//  NewsCell.swift
//  News
//
//  Created by Berke Parıldar on 21.06.2024.
//

import SwiftUI

struct NewsCell: View {
    let article: Article
    var body: some View {
        VStack {
            HStack {
                VStack (alignment: .leading, content: {
                    Text(article.source.name ?? "")
                        .padding(8)
                    Text(article.title ?? "")
                        .fontWeight(.semibold)
                        .padding(8)
                })
                AsyncImage(url: article.urlToImage, content: { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 8))
                }, placeholder: { ProgressView() })
            }
            Text("Hello")
        }
    }
}
