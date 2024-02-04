//
//  NewsItem.swift
//  TheNews
//
//  Created by Sanjana Babhulgaonkar on 03/02/24.
//


import SwiftUI

struct NewsItem: View {
    let story: Story

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Spacer()
                Text(story.title)
                    .font(.headline)
                Spacer()
                HStack {
                    Text("Author: \(story.author)")
                        .foregroundColor(.gray)
                }
                .font(.subheadline)
                Spacer()
            }
        }
    }
}
