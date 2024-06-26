//
//  OnBoardingViewModel.swift
//  News
//
//  Created by Berke Parıldar on 26.06.2024.
//

import Foundation

final class OnBoardingViewModel: ObservableObject {
    @Published var selectedCategories: Set<String> {
        didSet {
            UserDefaults.standard.set(Array(selectedCategories), forKey: "userCategories")
        }
    }
    
    let allCategories = ["business", "sports", "health", "science", "entertainment", "technology"]
    
    init() {
        let savedCategories = UserDefaults.standard.stringArray(forKey: "userCategories") ?? []
        selectedCategories = Set(savedCategories)
    }
    
    func toggleCategory(_ category: String) {
        if selectedCategories.contains(category) {
            selectedCategories.remove(category)
        } else {
            selectedCategories.insert(category)
        }
    }
    
    func seenOnBoarding() {
        UserDefaults.standard.set(true, forKey: "hasSeenOnboarding")
    }
}
