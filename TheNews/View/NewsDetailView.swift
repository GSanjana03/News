//
//  NewsDetailView.swift
//  TheNews
//
//  Created by Sanjana Babhulgaonkar on 03/02/24.
//


import SwiftUI

struct NewsDetailView: View {
    private let url: String?

    init(_ url: String?) {
        self.url = url
    }

    var body: some View {
        WebView(url)
    }
}

struct NewsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailView("https://www.google.com")
            .preferredColorScheme(.dark)

        NewsDetailView("https://www.google.com")
            .preferredColorScheme(.light)
    }
}
