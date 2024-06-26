//
//  CustomTabBar.swift
//  News
//
//  Created by Berke Parıldar on 26.06.2024.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: Int?
    let tabIcons = ["house", "chart.line.uptrend.xyaxis", "globe"]
    var body: some View {
        VStack (spacing: 0) {
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(.separator)
            HStack {
                ForEach(tabIcons.indices, id: \.self) { index in
                    Spacer()
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            selectedTab = index
                        }
                    }) {
                        ZStack {
                            if selectedTab == index {
                                Capsule()
                                    .fill(Color.blue)
                                    .frame(height: 30)
                                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
                                    .animation(.easeInOut(duration: 0.3), value: selectedTab)
                            }
                            Image(systemName: tabIcons[index])
                                .foregroundColor(selectedTab == index ? .white : .gray)
                        }
                        .frame(width: 80, height: 48)
                    }
                    .buttonStyle(StaticButtonStyle())
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 44)
        }
    }
}

#Preview {
    CustomTabBar(selectedTab: .constant(2))
}
