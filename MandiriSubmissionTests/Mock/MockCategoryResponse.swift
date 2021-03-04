//
//  MockCategoryResponse.swift
//  MandiriSubmissionTests
//
//  Created by Moh Zinnur Atthufail Addausi on 04/03/21.
//

import XCTest
@testable import MandiriSubmission
extension CategoryModel {
    static func load() -> CategoryModel {
        return CategoryModel(categoryName: "Business")
    }

}
