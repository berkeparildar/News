//
//  SearchViewModel.swift
//  News
//
//  Created by Berke Parıldar on 26.06.2024.
//

import Foundation
import Combine

final class SearchViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var articles: [Article] = []
    
    private var cancellables = Set<AnyCancellable>()
    private var searchCancellable: AnyCancellable? = nil
    private let baseURL = URL(string: "https://newsapi.org/v2/everything")!
    
    init() {
        $searchText
            .removeDuplicates()
            .sink { [weak self] text in
                if text.isEmpty {
                    self?.articles.removeAll()
                }
            }
            .store(in: &cancellables)
        
        $searchText
            .removeDuplicates()
            .filter { !$0.isEmpty }
            .debounce(for: .seconds(2), scheduler: DispatchQueue.main)
            .sink { [weak self] text in
                self?.fetchArticles(for: text)
            }
            .store(in: &cancellables)
    }
    
    private func fetchArticles(for query: String) {
        var fetchComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        fetchComponents?.queryItems = [
            URLQueryItem(name: "apiKey", value: "862aa29a7ec149c0b0bbc2c1f4b89f2b"),
            URLQueryItem(name: "pageSize", value: "100"),
            URLQueryItem(name: "q", value: searchText),
            URLQueryItem(name: "sortBy", value: "popularity"),
            URLQueryItem(name: "searchIn", value: "title"),
            URLQueryItem(name: "language", value: "en")
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
                    self.articles.removeAll()
                    let articles = response.articles
                    self.articles.append(contentsOf: articles.filter( { $0.title != "[Removed]" }))
                }
            } catch let decodingError {
                print(url)
                print("There was an error during decoding \(decodingError.localizedDescription)")
                return
            }
        }.resume()
    }
}
