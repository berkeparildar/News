//
//  GroupDivider.swift
//  News
//
//  Created by Berke Parıldar on 21.06.2024.
//

import SwiftUI

struct GroupDivider: View {
    var height: CGFloat = 8
    
    var body: some View {
        Rectangle()
            .fill(.regularMaterial)
            .frame(height: height)
            .edgesIgnoringSafeArea(.horizontal)
    }
}

#Preview {
    GroupDivider()
}
