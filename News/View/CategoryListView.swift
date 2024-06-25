//
//  CategoryListView.swift
//  News
//
//  Created by Berke Parıldar on 25.06.2024.
//

import SwiftUI

struct CategoryListView: View {
    var categories: [String]
    @Binding var selectedCategory: Int?
    
    
    var body: some View {
        ZStack {
            ScrollViewReader { reader in
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(categories.indices, id: \.self) { index in
                            Text(categories[index].capitalized)
                                .font(.headline)
                                .padding(.vertical, 4)
                                .padding(.horizontal, 16)
                                .tag(index)
                                .foregroundStyle(selectedCategory == index ? .blue : .primary)
                                .onTapGesture {
                                    withAnimation(.spring) {
                                        self.selectedCategory = index
                                        reader.scrollTo(index, anchor: .center)
                                    }
                                }
                                .scrollTransition(.animated.threshold(.visible(0.9))) { content, phase in
                                    content
                                        .opacity(phase.isIdentity ? 1 : 0.5)
                                        .scaleEffect(phase.isIdentity ? 1 : 0.55)
                                }
                        }
                    }
                    .scrollTargetLayout()
                }
                .onChange(of: selectedCategory, { oldValue, newValue in
                    withAnimation(.spring) {
                        reader.scrollTo(selectedCategory ?? 0, anchor: .center)
                    }
                })
            }
        }
    }
}

#Preview {
    CategoryListView(categories: ["business" ,"entertainment", "health","science","sports","technology"], selectedCategory: .constant(0))
}
