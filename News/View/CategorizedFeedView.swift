//
//  CategorizedFeedView.swift
//  News
//
//  Created by Berke Parıldar on 23.06.2024.
//

import SwiftUI

struct CategorizedFeedView: View {
    private var categories = ["business" ,"entertainment", "general", "health","science","sports","technology"]
    @State var firstScrollIndex = 0
    @State var secondScrollIndex = 0
    var body: some View {
        VStack {
            ScrollViewReader { proxyOne in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(categories, id: \.self) { category in
                            Text(category)
                                .font(.title)
                                .id(category)
                                .onTapGesture {
                                    proxyOne.scrollTo(category, anchor: .center)
                                }
                        }
                    }
                }
            }
            ScrollViewReader { proxyTwo in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(categories, id: \.self) { category in
                            Text(category)
                                .font(.title)
                                .id(category)
                                .onTapGesture {
                                    proxyTwo.scrollTo(category, anchor: .center)
                                }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    CategorizedFeedView()
}

