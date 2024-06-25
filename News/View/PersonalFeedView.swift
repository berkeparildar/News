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
                        HStack {
                            Text(viewModel.userCategories[index].capitalized)
                                .font(.system(size: 24))
                                .bold()
                                .foregroundStyle(.blue)
                                .onTapGesture {
                                    withAnimation(.easeInOut(duration: 0.3)) {
                                        selectedTab = 2
                                        if let retrievedCategories = UserDefaults.standard.stringArray(forKey: UserDefaultKeys.articleCategories.rawValue) {
                                            selectedCategory = retrievedCategories.firstIndex(of: viewModel.userCategories[index])
                                        }                           }
                                    
                                }
                            Spacer()
                        }
                        .listRowSeparator(.hidden)
                        ArticleGroupView(articles: articles, isSmallCell: false)
                    }
                }
                .listStyle(.plain)
                .navigationTitle("News")
                .navigationBarTitleDisplayMode(.inline)
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

