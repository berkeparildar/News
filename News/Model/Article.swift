//
//  Article.swift
//  News
//
//  Created by Berke Parıldar on 20.06.2024.
//

import Foundation

struct Article: Decodable, Identifiable, Equatable {
    var id: UUID { UUID() }
    let source: ArticleSource
    let author: String?
    let title: String?
    let url: URL?
    let urlToImage: URL?
    let publishedAt: String?

    struct ArticleSource: Decodable {
        let id: String?
        let name: String?
    }

    static func == (lhs: Article, rhs: Article) -> Bool {
        return lhs.url == rhs.url || lhs.title == rhs.title
    }

    enum CodingKeys: String, CodingKey {
        case source, author, title, url, urlToImage, publishedAt
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        source = try container.decode(ArticleSource.self, forKey: .source)
        author = try container.decodeIfPresent(String.self, forKey: .author)
        title = try container.decodeIfPresent(String.self, forKey: .title)
        url = try container.decodeIfPresent(URL.self, forKey: .url)
        urlToImage = try container.decodeIfPresent(URL.self, forKey: .urlToImage)
        publishedAt = try container.decodeIfPresent(String.self, forKey: .publishedAt)
    }
}
