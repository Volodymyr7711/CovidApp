//
//  NewsFeed.swift
//  CovidApp
//
//  Created by Volodymyr Mendyk on 11.03.2021.
//

import Foundation

struct NewsFeed: Codable {
    
    var status: String
    var articles: [Article]
}

struct Article: Codable {
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var content: String?
    var source: Name?
}

struct Name: Codable {
    var id: String?
    var name: String?
}
