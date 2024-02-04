//
//  NewsViewModel.swift
//  TheNews
//
//  Created by Sanjana Babhulgaonkar on 03/02/24.
//

import Foundation
import Alamofire

class NewsViewModel: ObservableObject {
    @Published private(set) var lastStories: [Story]?
    //fetch Stories
    func fetchStories() {
        let url = "\(Constants.baseURL)/search_by_date?tags=story"
        AF.request(url).responseDecodable(of: Story.Results.self) { response in
            switch response.result {
            case .success(let data):
                self.lastStories = data.hits
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
    
    func mockNewsData(completion: @escaping ([Story]?) -> Void) {
        let url = "\(Constants.baseURL)/search_by_date?tags=story"
        AF.request(url).responseDecodable(of: Story.Results.self) { response in
            switch response.result {
            case .success(let data):
                self.lastStories = data.hits
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}
