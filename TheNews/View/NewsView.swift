//
//  ContentView.swift
//  TheNews
//
//  Created by Sanjana Babhulgaonkar on 03/02/24.
//


import SwiftUI

struct NewsView: View {
    @ObservedObject private var newsViewModel: NewsViewModel = NewsViewModel()

    private var stories: [Story]? {
        return newsViewModel.latestStories
    }

    var body: some View {
        NavigationView {
           
            ZStack {
                Color.white.ignoresSafeArea()
             
                if stories != nil {
                    List(stories ?? []) { story in
                        if newsViewModel.isEmptyUrl(url: story.url ?? ""){
                            NavigationLink(destination: NewsDetailView(story.url)) {
                                if newsViewModel.isEmptyTitle(title: story.title){
                                    NewsItem(story: story)
                                }
                            }
                        }
                    }
                    .navigationTitle(Constants.appName)
                        .refreshable {
                            newsViewModel.fetchStories()
                        }
                }
                if newsViewModel.isError {
                    Text(Constants.loadingError)
                        .navigationTitle(Constants.appName)
                }
                
                if newsViewModel.showLoader {
                    ProgressView()
                        .scaleEffect(2.0, anchor: .center)
                        .progressViewStyle(CircularProgressViewStyle.init(tint: Color.gray))
                }
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
