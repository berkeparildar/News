//
//  ForYouView.swift
//  News
//
//  Created by Berke Parıldar on 22.06.2024.
//

import SwiftUI

struct PersonalFeedView: View {
    @StateObject var viewModel = ForYouViewModel()
    var body: some View {
        NavigationStack {
            switch viewModel.status {
            case .success:
                List {
                    ForEach(Array(viewModel.forYouArticles.enumerated()), id: \.offset) { index, articles in
                        NavigationLink(destination: ArticleListView(viewModel: ArticleListViewModel(fetchCategory: FetchCategory(rawValue: viewModel.userCategories[index]) ?? .all))) {
                            HStack {
                                Text(viewModel.userCategories[index].capitalized)
                                    .font(.system(size: 24))
                                    .bold()
                                    .foregroundStyle(.blue)
                                Spacer()
                            }
                        }
                        .listRowSeparator(.hidden)
                        ArticleGroupView(articles: articles)
                    }
                }
                .listStyle(.plain)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        VStack (alignment: .leading) {
                            Text("Your briefing")
                                .font(.title3)
                                .bold()
                            Text("Thursday, June 20")
                                .font(.footnote)
                                .foregroundStyle(.secondary)
                                .padding(.bottom, 2)
                        }
                        .padding(.leading, 4)
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        HStack {
                            Text("29'C")
                                .bold()
                            Image(systemName: "sun.max")
                                .font(.title3)
                                .foregroundStyle(.yellow)
                        }
                        .padding(EdgeInsets(top: 2, leading: 8, bottom: 2, trailing: 8))
                        .background(in: .capsule)
                        .backgroundStyle(.regularMaterial)
                    }
                }
                .toolbarBackground(.background, for: .navigationBar)
            case .fetching:
                ProgressView()
            case .failure:
                Text("Error")
                    .foregroundColor(.red)
            default:
                EmptyView()
            }
        }
        .onAppear {
            viewModel.fetchUserArticles()
        }
    }
}

#Preview {
    PersonalFeedView()
}
