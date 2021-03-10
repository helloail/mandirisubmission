//
//  API.swift
//  Sources
//
//  Created by Moh Zinnur Atthufail Addausi on 09/03/21.
//

import Foundation
struct API {
    static let baseUrl = "https://newsapi.org/v2/"
    static let apikey = "c6bb0e644b134a8aa11e463d99fa915f"
}
protocol Endpoint {
  var url: String { get }
}

enum Endpoints {
  
  enum Gets: Endpoint {
    case sources
    case article(key: String)
    
    public var url: String {
      switch self {
      case .sources: return "\(API.baseUrl)sources?"
      case .article(let key): return "\(API.baseUrl)top-headlines?sources=\(key)&apiKey=\(API.apikey)"
      }
    }
  }
}
