//
//  MockArticleDataSource.swift
//  MandiriSubmissionTests
//
//  Created by Moh Zinnur Atthufail Addausi on 04/03/21.
//

import XCTest
@testable import MandiriSubmission
class MockArticleRemoteDataSource: ArticleRemoteDataSourceProtocol {

    let mockData: ArticleModel?
    
    var catchdataStatus: Result<ArticleModel, Error>
    
    init(mockData: ArticleModel) {
        self.mockData = mockData
        self.catchdataStatus = .success(mockData)
    }
    
    func catchArticleList(key: String, completion: @escaping ((Result<ArticleModel, Error>) -> Void)) {
        
        completion(catchdataStatus)
    }
}
