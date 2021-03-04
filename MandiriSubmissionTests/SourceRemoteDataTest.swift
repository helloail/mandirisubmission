//
//  SourceRemoteDataTest.swift
//  MandiriSubmissionTests
//
//  Created by Moh Zinnur Atthufail Addausi on 04/03/21.
//

import Foundation
import XCTest
@testable import MandiriSubmission

class SourceRemoteDataTest: XCTestCase {
    
    func test_ParserData_whenJsonData_thenSuccessParser() {
        
        // given
        let json = """
        {
            "status": "ok",
            "sources": [
                {
                    "id": "argaam",
                    "name": "Argaam",
                    "description": "ارقام موقع متخصص في متابعة سوق الأسهم السعودي تداول - تاسي - مع تغطيه معمقة لشركات واسعار ومنتجات البتروكيماويات , تقارير مالية الاكتتابات الجديده ",
                    "url": "http://www.argaam.com",
                    "category": "business",
                    "language": "ar",
                    "country": "sa"
                }
            ]
        }
        """.data(using: .utf8)!
        
        // when
        let posts = try? JSON().newJSONDecoder().decode(SourcesModel.self, from: json)
        
        // then
        XCTAssertNotNil(posts)
        XCTAssertEqual(posts?.sources?.first?.name, SourcesModel.load().sources?.first?.name)
        
    }
}
