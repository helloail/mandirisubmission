//
//  MockArticleResponse.swift
//  MandiriSubmissionTests
//
//  Created by Moh Zinnur Atthufail Addausi on 04/03/21.
//

import XCTest
@testable import MandiriSubmission
extension ArticleModel {
    static func load() -> ArticleModel {
        return ArticleModel(status: "ok",
                            totalResults: 10,
                            articles: [ Articles(author: "BBC News",
                                                 title: "Linda Reynolds: Australian minister 'regrets' slur on alleged rape victim - PM",
                                                 articleDescription: "Defence Minister Linda Reynolds has not denied calling an alleged rape victim a \"lying cow\".",
                                                 url: "http://www.bbc.co.uk/news/world-australia-56275063",
                                                 urlToImage: "https://ichef.bbci.co.uk/news/1024/branded_news/BAF1/production/_117375874_gettyimages-1303416796.jpg",
                                                 publishedAt: "2021-03-04T02:52:19.7497181Z",
                                                 content: "image copyrightGetty")
                            ])
        
    }
}
