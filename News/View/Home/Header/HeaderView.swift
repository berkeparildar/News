//
//  HeaderView.swift
//  News
//
//  Created by Berke Parıldar on 20.06.2024.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text("Your briefing")
                    .font(.title)
                    .bold()
                Text("Thursday, June 20")
            }
            Spacer()
            HStack {
                Text("29'C")
                    .bold()
                Image(systemName: "sun.max")
                    .font(.largeTitle)
                    .foregroundStyle(.yellow)
            }
            .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
            .background(in: .capsule)
            .backgroundStyle(.regularMaterial)
        }
        .padding(8)
    }
}

#Preview {
    HeaderView()
}
