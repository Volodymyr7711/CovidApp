//
//  Articles.swift
//  CovidApp
//
//  Created by Oleksandr on 17.02.2022.
//

import Foundation

class ArticleViewModel{
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let content: String?
    let source: NameViewModel?
    
    init(articles: Article, source: NameViewModel){
        self.author = articles.author
        self.title = articles.title
        self.description = articles.description
        self.url = articles.url
        self.urlToImage = articles.urlToImage
        self.content = articles.content
        self.source = source
    }
}
