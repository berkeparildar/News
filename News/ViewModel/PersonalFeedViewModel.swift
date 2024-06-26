//
//  ForYouViewModel.swift
//  News
//
//  Created by Berke Parıldar on 22.06.2024.
//

import Foundation

final class ForYouViewModel: ObservableObject {
    enum FetchStatus {
        case notStarted, fetching, success, failure
    }
    
    @Published var forYouArticles: [[Article]] = []
    @Published var status = FetchStatus.notStarted
    private let baseURL = URL(string: "https://newsapi.org/v2/top-headlines")!
    var userCategories = ["entertainment", "business", "health"]
    
    func fetchUserArticles() {
        guard status == .notStarted else { return }
        status = .fetching
        let dispatchGroup = DispatchGroup()
        
        for category in userCategories {
            dispatchGroup.enter()
            var fetchComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
            fetchComponents?.queryItems = [
                URLQueryItem(name: "country", value: "us"),
                URLQueryItem(name: "apiKey", value: "11c24ef23d0048c385f60c6f9b106233"),
                URLQueryItem(name: "pageSize", value: "10"),
                URLQueryItem(name: "category", value: category)
            ]
            
            guard let url = fetchComponents?.url else {
                dispatchGroup.leave()
                continue
            }
            
            URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                defer { dispatchGroup.leave() }
                
                if let error = error {
                    DispatchQueue.main.async {
                        print("Error fetching articles: \(error.localizedDescription)")
                    }
                    return
                }
                
                guard let data = data else {
                    DispatchQueue.main.async {
                        print("No data received.")
                    }
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    let response = try decoder.decode(ArticleResponse.self, from: data)
                    let articles = response.articles.filter { $0.title != "[Removed]" }
                    DispatchQueue.main.async {
                        self?.forYouArticles.append(articles)
                    }
                } catch {
                    DispatchQueue.main.async {
                        print("Error decoding data: \(error.localizedDescription)")
                    }
                }
            }.resume()
        }
        
        dispatchGroup.notify(queue: .main) {
            self.status = self.forYouArticles.isEmpty ? .failure : .success
        }
    }
}
