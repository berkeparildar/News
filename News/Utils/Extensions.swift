//
//  Extensions.swift
//  News
//
//  Created by Berke Parıldar on 25.06.2024.
//

import Foundation
import SwiftUI

extension String {
    func cutAfterLast(occurrenceOf character: Character) -> String {
        if let lastIndex = self.lastIndex(of: character) {
            return String(self[..<lastIndex])
        }
        return self
    }
}

struct StaticButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}
