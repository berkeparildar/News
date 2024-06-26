//
//  OnBoardingView.swift
//  News
//
//  Created by Berke Parıldar on 26.06.2024.
//

import SwiftUI

struct OnBoardingView: View {
    @StateObject var viewModel = OnBoardingViewModel()
    @ObservedObject var locationManager = LocationManager()
    @Binding var hasSeenOnboaring: Bool
    var body: some View {
        GeometryReader { reader in
            TabView {
                VStack {
                    ZStack {
                        Circle()
                            .frame(width: 200, height: 200)
                            .foregroundStyle(.clear)
                        Image(systemName: "newspaper")
                            .font(.system(size: 106))
                            .foregroundStyle(.primary)
                    }
                    .padding(.top, 80)
                    Text("Welcome to News")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    Text("From politics to entertainment: your one-stop source for comprehensive coverage of the latest news and developments across the globe will be right on your hand.")
                        .padding()
                    Spacer()
                }
                .frame(width: reader.size.width, height: reader.size.height)
                .tag(0)
                VStack {
                    Text("Your Interests")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                        .padding(.top, 32)
                    Text("Select the categories you are interested in. Your personal feed will have articles from these categories")
                        .padding()
                    LazyVGrid(columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ], spacing: 20) {
                        ForEach(viewModel.allCategories, id: \.self) { category in
                            Text(category.capitalized)
                                .padding(.vertical, 10)
                                .frame(maxWidth: .infinity)
                                .background(viewModel.selectedCategories.contains(category) ? Color.blue : .clear)
                                .foregroundColor(.primary)
                                .clipShape(Capsule())
                                .overlay(
                                    Capsule()
                                        .stroke(.primary, lineWidth: 3)
                                )
                                .onTapGesture {
                                    withAnimation {
                                        viewModel.toggleCategory(category)
                                    }
                                }
                        }
                    }
                    .padding()
                    Spacer()
                    Button {
                        viewModel.seenOnBoarding()
                        hasSeenOnboaring = true
                    } label: {
                        Text("Explore now")
                    }
                    .padding(10)
                    .foregroundColor(.primary)
                    .background(.blue)
                    .clipShape(Capsule())
                    Spacer()
                }
                .tag(1)
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .automatic))
            .background(
                RadialGradient(gradient: Gradient(colors: [Color(.systemBackground), .blue]), center: .center, startRadius: 10, endRadius: 500)
            )
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    OnBoardingView(hasSeenOnboaring: .constant(true))
}
