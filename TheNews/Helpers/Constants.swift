//
//  Constants.swift
//  TheNews
//
//  Created by Sanjana Babhulgaonkar on 03/02/24.
//

import Foundation

struct Constants {
    static let appName: String = "Latest News"
    static let loadingError: String = "Error! Cannot load news."
    static let baseURL: String = "http://hn.algolia.com/api/v1"
}

extension Bundle {
    static var newsTest: Bundle {
        return Bundle(identifier: "abcd.TheNewsTests")!
    }
}
