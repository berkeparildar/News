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

extension Date {
    static func from(iso8601String: String) -> Date? {
        let formatter = ISO8601DateFormatter()
        return formatter.date(from: iso8601String)
    }
    
    func timeAgoDisplay() -> String {
        let interval = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: self, to: Date())
        if let year = interval.year, year > 0 {
            return "\(year)y"
        } else if let month = interval.month, month > 0 {
            return "\(month)mo"
        } else if let day = interval.day, day > 0 {
            return "\(day)d"
        } else if let hour = interval.hour, hour > 0 {
            return "\(hour)h"
        } else if let minute = interval.minute, minute > 0 {
            return "\(minute)m"
        } else {
            return "just now"
        }
    }
}
