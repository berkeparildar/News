//
//  CategorizedFeedView.swift
//  News
//
//  Created by Berke Parıldar on 23.06.2024.
//

import SwiftUI

struct CategorizedFeedView: View {
    private let categories = ["business" , "sports", "health", "science", "entertainment", "technology"]
    @Binding var selectedCategory: Int?
    var body: some View {
        NavigationStack {
            GeometryReader { reader in
                VStack (spacing: 16) {
                    CategoryListView(categories: categories, selectedCategory: $selectedCategory)
                        .frame(height: 16)
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 0) {
                            ForEach(categories.indices, id: \.self) { index in
                                ArticleListView(viewModel: ArticleListViewModel(fetchCategory: FetchCategory(rawValue: categories[index])!))
                                    .tag(index)
                                    .frame(width: reader.size.width, height: reader.size.height)

                            }
                        }
                        .scrollTargetLayout()
                    }
                    .scrollTargetBehavior(.paging)
                    .scrollPosition(id: $selectedCategory)
                }
            }
            .navigationTitle("Headlines")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("Search tapped")
                    }) {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.foreground)
                            .font(.subheadline)
                    }
                }
        }
        }
    }
}

#Preview {
    CategorizedFeedView(selectedCategory: .constant(0))
}

