//
//  ForYouView.swift
//  News
//
//  Created by Berke Parıldar on 22.06.2024.
//

import SwiftUI

struct PersonalFeedView: View {
    @StateObject var viewModel = ForYouViewModel()
    @Binding var selectedTab: Int?
    @Binding var selectedCategory: Int?
    var body: some View {
        NavigationStack {
            switch viewModel.status {
            case .success:
                List {
                    PersonalHeaderView()
                    ForEach(Array(viewModel.forYouArticles.enumerated()), id: \.offset) { index, articles in
                        CategoryTitleView(title: viewModel.userCategories[index].capitalized)
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 0.3)) {
                                    selectedTab = 2
                                    if let retrievedCategories = UserDefaults.standard.stringArray(forKey: UserDefaultKeys.articleCategories.rawValue) {
                                        selectedCategory = retrievedCategories.firstIndex(of: viewModel.userCategories[index])
                                    }                           }
                                
                            }
                        
                        ArticleGroupView(articles: articles, isSmallCell: false)
                    }
                }
                .listStyle(.plain)
                .navigationTitle("News")
                .navigationBarTitleDisplayMode(.inline)
                .toolbarBackground(.background, for: .navigationBar)
                .toolbar {
                    NavigationLink(destination: {
                        ArticleSearchView()
                    }, label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.foreground)
                            .font(.subheadline)
                    })
                }
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

