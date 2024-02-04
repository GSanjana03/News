//
//  ContentView.swift
//  TheNews
//
//  Created by Sanjana Babhulgaonkar on 03/02/24.
//


import SwiftUI

struct NewsView: View {
    @ObservedObject private var newsViewModel: NewsViewModel = NewsViewModel()
   // @State private var search: String = ""

    private var stories: [Story]? {
       /* if search.isEmpty && newsViewModel.lastStories != nil {
            return newsViewModel.lastStories
        } else {
            newsViewModel.fetchMatchStories(for: search)
            return newsViewModel.matchStories
        }*/
        return newsViewModel.lastStories
    }

    var body: some View {
        NavigationView {
            if stories != nil {
                List(stories!) { story in
                    if story.url != nil {
                        NavigationLink(destination: NewsDetailView(story.url)) {
                            NewsItem(story: story)
                        }
                    }
                }.navigationTitle(Constants.appName)
                .refreshable {
                    newsViewModel.fetchStories()
                }
            } else {
                Text(Constants.loadingError)
                    .navigationTitle(Constants.appName)
            }
        }
        .onAppear {
            newsViewModel.fetchStories()
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
