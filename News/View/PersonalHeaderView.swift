//
//  PersonalHeaderView.swift
//  News
//
//  Created by Berke Parıldar on 25.06.2024.
//

import SwiftUI

struct PersonalHeaderView: View {
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text("Your briefing")
                    .font(.title)
                    .bold()
                Text("Thursday, June 20")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .padding(.bottom, 2)
            }
            .padding(.leading, 4)
            Spacer()
            HStack {
                Text("29'C")
                    .bold()
                Image(systemName: "sun.max")
                    .font(.title3)
                    .foregroundStyle(.yellow)
            }
            .padding(8)
            .background(in: .capsule)
            .backgroundStyle(.regularMaterial)
        }
        .listSectionSeparator(.hidden)
    }
}

#Preview {
    PersonalHeaderView()
}
