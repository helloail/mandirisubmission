//
//  ArticleResponse.swift
//  Sources
//
//  Created by Moh Zinnur Atthufail Addausi on 09/03/21.
//

import Foundation

// MARK: - ArticleModel
public struct ArticleModel: Codable {
  
    public var status: String?
    public var totalResults: Int?
    public var articles: [Articles]?
    
    public init(status: String? = nil, totalResults: Int? = nil, articles: [Articles]? = nil) {
        self.status = status
        self.totalResults = totalResults
        self.articles = articles
    }
}

// MARK: - Article
public struct Articles: Codable, Identifiable, Equatable {
  
    public let id = UUID()
    public let author: String?
    public let title: String
    public let articleDescription: String?
    public let url: String?
    public let urlToImage: String?
    public let publishedAt: String?
    public let content: String?

    enum CodingKeys: String, CodingKey {
        case author = "author"
        case title = "title"
        case articleDescription = "description"
        case url = "url"
        case urlToImage = "urlToImage"
        case publishedAt = "publishedAt"
        case content = "content"
    }
    
    public init(author: String?, title: String, articleDescription: String?, url: String?, urlToImage: String?, publishedAt: String?, content: String?) {
        self.author = author
        self.title = title
        self.articleDescription = articleDescription
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
        self.content = content
    }
}
