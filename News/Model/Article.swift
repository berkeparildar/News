//
//  Article.swift
//  News
//
//  Created by Berke Parıldar on 20.06.2024.
//

import Foundation

struct Article: Decodable, Identifiable {
    let id = UUID()
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
}


