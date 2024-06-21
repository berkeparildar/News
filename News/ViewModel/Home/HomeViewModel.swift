//
//  HomeViewModel.swift
//  News
//
//  Created by Berke Parıldar on 20.06.2024.
//

import Foundation

final class HomeViewModel: ObservableObject {
    enum FetchStatus {
        case notStarted
        case fetching
        case success
    }
    
    private let baseURL = URL(string: "https://newsapi.org/v2/top-headlines")!
    @Published private(set) var status = FetchStatus.notStarted
    var articles: [Article] = []
    
    func fetchTopArticles() {
        status = .fetching
        var fetchComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        fetchComponents?.queryItems = [
            URLQueryItem(name: "country", value: "us"),
            URLQueryItem(name: "apiKey", value: "11c24ef23d0048c385f60c6f9b106233")
        ]
        guard let url = fetchComponents?.url else {
            return
        }
        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let self = self else { return }
            if let error = error {
                print("Error fetching articles: \(error.localizedDescription)")
                return
            }
            guard let data = data else {
                print("No data received")
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let response = try decoder.decode(ArticleResponse.self, from: data)
                DispatchQueue.main.async {
                    let articles = response.articles
                    self.articles = articles
                    self.status = .success
                    
                }
            } catch let decodingError {
                print("There was an error during decoding \(decodingError.localizedDescription)")
                return
            }
        }.resume()
    }
}
