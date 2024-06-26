//
//  CategoryTitleView.swift
//  News
//
//  Created by Berke Parıldar on 26.06.2024.
//

import SwiftUI

struct CategoryTitleView: View {
    let title: String
    var body: some View {
        VStack (alignment: .leading) {
            Text(title)
                .font(.system(size: 24))
                .bold()
            .foregroundStyle(.blue)
        }
        .listRowSeparator(.hidden)
    }
}

#Preview {
    CategoryTitleView(title: "Business")
}
