//
//  ArticleResponse.swift
//  News
//
//  Created by Berke Parıldar on 20.06.2024.
//

import Foundation

struct ArticleResponse: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}
