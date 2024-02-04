//
//  NewsViewModel.swift
//  TheNews
//
//  Created by Sanjana Babhulgaonkar on 03/02/24.
//

import Foundation
import Alamofire

class NewsViewModel: ObservableObject {
    @Published private(set) var latestStories: [Story]?
    @Published var showLoader = false
    @Published var isError = false

    //fetch Stories
    func fetchStories() {
        showLoader = true
        let url = "\(Constants.baseURL)/search_by_date?tags=story"
        AF.request(url).responseDecodable(of: Story.Results.self) { response in
            switch response.result {
            case .success(let data):
                self.latestStories = data.hits
                self.showLoader = false
                self.isError = false
            case .failure(let error):
                debugPrint(error)
                self.isError = true
            }
        }
    }
    
    func mockNewsData(storyData: Story.Results) {
        self.latestStories = storyData.hits
    }
}
