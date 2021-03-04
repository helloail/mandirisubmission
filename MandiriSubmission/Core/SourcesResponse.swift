//
//  SourcesResponse.swift
//  MandiriSubmission
//
//  Created by Moh Zinnur Atthufail Addausi on 03/03/21.
//

import Foundation

// MARK: - SourcesModel
struct SourcesModel: Codable {
    var status: String?
    var sources: [Source]?

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case sources = "sources"
    }
}

// MARK: - Source
struct Source: Codable, Identifiable {
    let id: String
    let name: String
    let sourceDescription: String?
    let url: String?
    let category: String?
    let language: String?
    let country: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case sourceDescription = "description"
        case url = "url"
        case category = "category"
        case language = "language"
        case country = "country"
    }
}
