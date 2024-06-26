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
                VStack (spacing: 0) {
                    CategoryListView(categories: categories, selectedCategory: $selectedCategory)
                        .frame(height: 32)
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 0) {
                            ForEach(categories.indices, id: \.self) { index in
                                ArticleListView(viewModel: ArticleListViewModel(fetchCategory: FetchCategory(rawValue: categories[index])!), isSmallCell: true)
                                    .tag(index)
                                    .frame(width: reader.size.width, height: reader.size.height)
                                
                            }
                            .padding(.top, 20)
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
                NavigationLink(destination: {
                    ArticleSearchView()
                }, label: {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.foreground)
                        .font(.subheadline)
                })
            }
        }
    }
}

#Preview {
    CategorizedFeedView(selectedCategory: .constant(0))
}

