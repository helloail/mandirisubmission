//
//  MockSourceResponse.swift
//  MandiriSubmissionTests
//
//  Created by Moh Zinnur Atthufail Addausi on 04/03/21.
//

import XCTest
@testable import MandiriSubmission
extension SourcesModel {
    static func load() -> SourcesModel {
        return SourcesModel(status: "ok",
                            sources: [Source(id: "argaam",
                                             name: "Argaam",
                                             sourceDescription: "ارقام موقع متخصص في متابعة سوق الأسهم السعودي تداول -",
                                             url: "http://www.argaam.com",
                                             category: "business",
                                             language: "ar",
                                             country: "sa")
                            ])
       
    }
}
