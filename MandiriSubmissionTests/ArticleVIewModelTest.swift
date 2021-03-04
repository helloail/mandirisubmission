//
//  ArticleVIewModelTest.swift
//  MandiriSubmissionTests
//
//  Created by Moh Zinnur Atthufail Addausi on 04/03/21.
//

import XCTest

@testable import MandiriSubmission
class ArticleViewModelTest: XCTestCase {

    func test_NewsViewModel_whenProvideData_thenCountOneItem() {
        
        // given
        let expectedData = ArticleModel.load()
        let service = MockArticleRemoteDataSource(mockData: expectedData)
        let viewModel = ArticleViewModel(articleservice: service)
        
        // when
        service.catchdataStatus = .success(expectedData)
        
        viewModel.fetchArticleExecute(sourcename: "nbc")
        
        // then
        DispatchQueue.main.async {
            XCTAssertEqual(viewModel.articlelist.count, 1)
        }

    }

    func test_NewsViewModel_whenProvideEmptyData_thenZeroItem() {

        // given
        let expectedData = ArticleModel()
        let service = MockArticleRemoteDataSource(mockData: expectedData)
        let viewModel = ArticleViewModel(articleservice: service)

        // when
        service.catchdataStatus = .success(expectedData)
        viewModel.fetchArticleExecute(sourcename: "cnnbc")
        
        // then
        DispatchQueue.main.async {
            XCTAssertEqual(viewModel.articlelist.count, 0)
        }

    }

    func test_NewsViewModel_whenPovideNilData_ThenZeroItem() {
        
        // given
        let expectedData: ArticleModel? = nil
        
        guard let expecteddata  = expectedData else {
            return
        }
        
        let service = MockArticleRemoteDataSource(mockData: expecteddata)
        let viewModel = ArticleViewModel(articleservice: service)
        
        // when
        
        service.catchdataStatus = .success(expecteddata)
        viewModel.fetchArticleExecute(sourcename: "cnnbc")
        
        // then
        DispatchQueue.main.async {
            XCTAssertEqual(viewModel.articlelist.count, 0)
        }
    }
    
    func test_NewsViewModel_whenProvideErrorResponse_thenError() {
        
        // given
        let expectedData = ArticleModel.load()
        let service = MockArticleRemoteDataSource(mockData: expectedData)
        service.catchdataStatus = .failure(NSError(domain: "", code: -1, userInfo: nil))
        let viewModel = ArticleViewModel(articleservice: service)
        
        // when
        viewModel.fetchArticleExecute(sourcename: "cnbc")
        
        // then
        XCTAssertNotNil(viewModel.state)
    }
}
