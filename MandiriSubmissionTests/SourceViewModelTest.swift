//
//  SourceViewModelTest.swift
//  MandiriSubmissionTests
//
//  Created by Moh Zinnur Atthufail Addausi on 04/03/21.
//

import XCTest


@testable import MandiriSubmission
class SourceViewModelTest: XCTestCase {

    func test_NewsViewModel_whenProvideData_thenCountOneItem() {
        
        // given
        let expectedData = SourcesModel.load()
        let service = MockSourceRemoteDataSource(mockData: expectedData)
        let viewModel = SourcesViewModel(sourcesservice: service)
        
        // when
        service.catchdataStatus = .success(expectedData)
        
        viewModel.fetchSourceExecute(sourcename: "")
        
        // then
        DispatchQueue.main.async {
            XCTAssertEqual(viewModel.sourcelist.count, 1)
        }

    }

    func test_NewsViewModel_whenProvideEmptyData_thenZeroItem() {

        // given
        let expectedData = SourcesModel()
        let service = MockSourceRemoteDataSource(mockData: expectedData)
        let viewModel = SourcesViewModel(sourcesservice: service)

        // when
        service.catchdataStatus = .success(expectedData)
        viewModel.fetchSourceExecute(sourcename: "")
        
        // then
        DispatchQueue.main.async {
            XCTAssertEqual(viewModel.sourcelist.count, 0)
        }

    }

    func test_NewsViewModel_whenPovideNilData_ThenZeroItem() {
        
        // given
        let expectedData: SourcesModel? = nil
        
        guard let expecteddata  = expectedData else {
            return
        }
        
        let service = MockSourceRemoteDataSource(mockData: expecteddata)
        let viewModel = SourcesViewModel(sourcesservice: service)
        
        // when
        
        service.catchdataStatus = .success(expecteddata)
        viewModel.fetchSourceExecute(sourcename: "")
        
        // then
        DispatchQueue.main.async {
            XCTAssertEqual(viewModel.sourcelist.count, 0)
        }
    }
    
    func test_NewsViewModel_whenProvideErrorResponse_thenError() {
        
        // given
        let expectedData = SourcesModel.load()
        let service = MockSourceRemoteDataSource(mockData: expectedData)
        service.catchdataStatus = .failure(NSError(domain: "", code: -1, userInfo: nil))
        let viewModel = SourcesViewModel(sourcesservice: service)
        
        // when
        viewModel.fetchSourceExecute(sourcename: "")
        
        // then
        XCTAssertNotNil(viewModel.state)
    }
}
