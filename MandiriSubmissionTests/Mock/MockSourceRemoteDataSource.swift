//
//  MockSourceRemoteDataSource.swift
//  MandiriSubmissionTests
//
//  Created by Moh Zinnur Atthufail Addausi on 04/03/21.
//


import XCTest
@testable import MandiriSubmission
class MockSourceRemoteDataSource: SourcesRemoteDataSourceProtocol {

    let mockData: SourcesModel?
    
    var catchdataStatus: Result<SourcesModel, Error>
    
    init(mockData: SourcesModel) {
        self.mockData = mockData
        self.catchdataStatus = .success(mockData)
    }
    
    func catchSourcesList(key: String, completion: @escaping ((Result<SourcesModel, Error>) -> Void)) {
        
        completion(catchdataStatus)
    }

}
