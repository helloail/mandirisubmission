//
//  ArticleRemoteDataTest.swift
//  MandiriSubmissionTests
//
//  Created by Moh Zinnur Atthufail Addausi on 04/03/21.
//
import Foundation
import XCTest
@testable import MandiriSubmission
@testable import Sources

//class ArticleRemoteDataTest: XCTestCase {
//    
//    func test_ParserData_whenJsonData_thenSuccessParser() {
//        
//        // given
//        let json = """
//        {
//            "status": "ok",
//            "totalResults": 10,
//            "articles": [
//                {
//                    "source": {
//                        "id": "bbc-news",
//                        "name": "BBC News"
//                    },
//                    "author": "BBC News",
//                    "title": "Linda Reynolds: Australian minister 'regrets' slur on alleged rape victim - PM",
//                    "description": "Defence Minister Linda Reynolds has not denied calling an alleged rape victim a \"lying cow\".",
//                    "url": "http://www.bbc.co.uk/news/world-australia-56275063",
//                    "urlToImage": "https://ichef.bbci.co.uk/news/1024/branded_news/BAF1/production/_117375874_gettyimages-1303416796.jpg",
//                    "publishedAt": "2021-03-04T02:52:19.7497181Z",
//                    "content": "image copyrightGetty Images\r\nimage captionLinda"
//                }
//            ]
//        }
//        """.data(using: .utf8)!
//        
//        // when
//        let posts = try? JSON().newJSONDecoder().decode(ArticleModel.self, from: json)
//        
//        // then
//        XCTAssertNotNil(posts)
//        XCTAssertEqual(posts?.articles?.first?.author, ArticleModel.load().articles?.first?.author)
//        
//    }
//}
