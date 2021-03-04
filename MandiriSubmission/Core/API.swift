//
//  API.swift
//  MandiriSubmission
//
//  Created by Moh Zinnur Atthufail Addausi on 03/03/21.
//

import Foundation
struct API {

  static let baseUrl = "https://newsapi.org/v2/"
    
}
//https://newsapi.org/v2/sources?category=business&apiKey=c6bb0e644b134a8aa11e463d99fa915f
protocol Endpoint {

  var url: String { get }
}

enum Endpoints {
  
  enum Gets: Endpoint {
    case sources
    case article
    
    public var url: String {
      switch self {
      case .sources: return "\(API.baseUrl)sources?"
      case .article: return "\(API.baseUrl)top-headlines?"
      }
    }
  }
}
