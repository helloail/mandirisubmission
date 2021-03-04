//
//  CategoryResponse.swift
//  MandiriSubmission
//
//  Created by Moh Zinnur Atthufail Addausi on 03/03/21.
//

import Foundation
import Foundation

// MARK: - CategoryElement
struct CategoryModel: Codable, Equatable, Identifiable {
    let id = UUID()
    let categoryName: String?

    enum CodingKeys: String, CodingKey {
        case categoryName = "CategoryName"
    }
}
