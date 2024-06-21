//
//  GroupTitle.swift
//  News
//
//  Created by Berke Parıldar on 21.06.2024.
//

import SwiftUI

struct GroupTitle: View {
    let titleText: String
    var body: some View {
        HStack {
            Text(titleText)
                .font(.system(size: 24))
                .bold()
                .foregroundStyle(.blue)
            Spacer()
        }
    }
}

#Preview {
    GroupTitle(titleText: "Top stories")
}
