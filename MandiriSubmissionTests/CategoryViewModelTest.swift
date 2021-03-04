//
//  CategoryViewModelTest.swift
//  MandiriSubmissionTests
//
//  Created by Moh Zinnur Atthufail Addausi on 04/03/21.
//

import XCTest

@testable import MandiriSubmission
class CategoryViewModelTest: XCTestCase {

    func test_NewsViewModel_whenProvideData_thenCountOneItem() {
        
        // given
        let expectedData = CategoryModel.load()
        let service = MockCategoryRemoteDataSource(mockData: [expectedData])
        let viewModel = CategoryViewModel(categoryservice: service)
        
        // when
        service.catchdataStatus = .success([expectedData])
        viewModel.fetchCategoryExecute()
        
        // then
        XCTAssertEqual(viewModel.categorylist.count, 1)
    }

    func test_NewsViewModel_whenProvideEmptyData_thenZeroItem() {

        // given
        let expectedData = [CategoryModel]()
        let service = MockCategoryRemoteDataSource(mockData: expectedData)
        let viewModel = CategoryViewModel(categoryservice: service)

        // when
        service.catchdataStatus = .success(expectedData)
        viewModel.fetchCategoryExecute()

        // then
        XCTAssertEqual(viewModel.categorylist.count, 0)
    }

    func test_NewsViewModel_whenPovideNilData_ThenZeroItem() {
        
        // given
        let expectedData: [CategoryModel]? = nil
        
        guard let expecteddata  = expectedData else {
            return
        }
        
        let service = MockCategoryRemoteDataSource(mockData: expecteddata)
        let viewModel =  CategoryViewModel(categoryservice: service)
        
        // when
        
        service.catchdataStatus = .success(expecteddata)
        viewModel.fetchCategoryExecute()
        
        // then
        XCTAssertEqual(viewModel.categorylist.count, 0)
    }
    
    func test_NewsViewModel_whenProvideErrorResponse_thenError() {
        
        // given
        let expectedData = CategoryModel.load()
        let service = MockCategoryRemoteDataSource(mockData: [expectedData])
        service.catchdataStatus = .failure(NSError(domain: "", code: -1, userInfo: nil))
        let viewModel =  CategoryViewModel(categoryservice: service)
        
        // when
        viewModel.fetchCategoryExecute()
        
        // then
        XCTAssertNotNil(viewModel.state)
    }
}
