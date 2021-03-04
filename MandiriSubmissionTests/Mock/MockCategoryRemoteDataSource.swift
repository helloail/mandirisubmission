//
//  MockCategoryRemoteDataSource.swift
//  MandiriSubmissionTests
//
//  Created by Moh Zinnur Atthufail Addausi on 04/03/21.
//

import XCTest
@testable import MandiriSubmission
class MockCategoryRemoteDataSource: CategoryRemoteDataSourceProtocol {

    let mockData: [CategoryModel]?
    
    var catchdataStatus: Result<[CategoryModel], Error>
    
    init(mockData: [CategoryModel]) {
        self.mockData = mockData
        self.catchdataStatus = .success(mockData)
    }
    
    func catchCategoryList(completion: @escaping ((Result<[CategoryModel], Error>) -> Void)) {
        
        completion(catchdataStatus)
    }

}
