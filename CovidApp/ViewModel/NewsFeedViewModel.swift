//
//  NewsFeedViewModel.swift
//  CovidApp
//
//  Created by Oleksandr on 12.02.2022.
//

import Foundation


struct NewsFeedViewModel: Codable {
    let status: String
    let articles: [ArticleViewModel]
    
    init(newsFeed: NewsFeedViewModel){
        self.status = newsFeed.status
        self.articles = newsFeed.articles
    }
}

struct ArticleViewModel: Codable {
    let author: String!
    let title: String!
    let description: String!
    let url: String!
    let urlToImage: String!
    let content: String!
    let source: NameViewModel!
    
    init(articles: ArticleViewModel){
        self.author = articles.author
        self.title = articles.title
        self.description = articles.description
        self.url = articles.url
        self.urlToImage = articles.urlToImage
        self.content = articles.content
        self.source = articles.source
    }
}

struct NameViewModel: Codable {
    let id: String!
    let name: String!
    
    init(name: Name){
        self.id = name.id
        self.name = name.name
    }
}
