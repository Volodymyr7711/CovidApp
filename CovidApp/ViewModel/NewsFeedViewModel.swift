//
//  NewsFeedViewModel.swift
//  CovidApp
//
//  Created by Oleksandr on 12.02.2022.
//

import Foundation


class NewsFeedViewModel{
    let status: String
    let articles: [ArticleViewModel]
    
    init(newsFeed: NewsFeed, articles: [ArticleViewModel]){
        self.status = newsFeed.status
        self.articles = articles
    }
}
