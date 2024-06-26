//
//  PersonalHeaderView.swift
//  News
//
//  Created by Berke Parıldar on 25.06.2024.
//

import SwiftUI

struct PersonalHeaderView: View {
    @State private var currentDate = Date()
    @StateObject private var viewModel = PersonalHeaderViewModel()
    let timer = Timer.publish(every: 60, on: .main, in: .common).autoconnect()
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text("Your briefing")
                    .font(.title)
                    .bold()
                Text(currentDate, format: Date.FormatStyle().day().month().weekday())
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .padding(.bottom, 2)
            }
            .padding(.leading, 4)
            Spacer()
            HStack {
                Text(viewModel.weather)
                    .bold()
                    .onAppear(perform: {
                    })
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
