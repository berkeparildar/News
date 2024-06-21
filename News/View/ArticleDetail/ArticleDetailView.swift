//
//  ArticleDetailView.swift
//  News
//
//  Created by Berke Parıldar on 21.06.2024.
//

import SwiftUI

struct ArticleDetailView: View {
    let url: URL
    
    var body: some View {
        WebView(url: url)
            .navigationBarTitle("Article", displayMode: .inline)
    }
}
