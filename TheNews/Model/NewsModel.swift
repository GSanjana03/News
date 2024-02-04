
//
//  NewsModel.swift
//  TheNews
//
//  Created by Sanjana Babhulgaonkar on 03/02/24.
//

import Foundation

struct Story: Identifiable, Codable {
    var id: String {
        objectID
    }
    let title: String
    let url: String?
    let author: String
    let objectID: String

    enum CodingKeys: String, CodingKey {
        case title
        case url
        case author
        case objectID
    }

    struct Results: Codable {
        let hits: [Story]
    }
}
