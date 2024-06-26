//
//  SourcesView.swift
//  News
//
//  Created by Berke Parıldar on 26.06.2024.
//

import SwiftUI

struct SourcesView: View {
    @Environment(\.horizontalSizeClass) var sizeClass

    let data = ["Short", "Longer Text", "The Longest Text Here", "Medium", "A Bit Longer Text"]
    
    // Decide how many columns to use based on the size class
    private var columns: [GridItem] {
        switch sizeClass {
        case .compact:
            // Use 2 columns in compact environments
            return Array(repeating: .init(.flexible()), count: 2)
        default:
            // Use more columns in more expansive environments
            return Array(repeating: .init(.flexible()), count: 2)
        }
    }

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(data, id: \.self) { item in
                    Text(item)
                        .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
        }
    }
}

#Preview {
    SourcesView()
}
