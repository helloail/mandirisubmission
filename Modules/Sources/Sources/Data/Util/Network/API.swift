//
//  API.swift
//  Sources
//
//  Created by Moh Zinnur Atthufail Addausi on 09/03/21.
//

import Foundation
struct API {
    static let baseUrl = "https://api.themoviedb.org/3/movie/"
    static let apikey = "507636b08f78cb257ef0da7f56dc514e"
}
protocol Endpoint {
  var url: String { get }
}

enum Endpoints {
  
  enum Gets: Endpoint {
  
    case movieurl(key: String)
    
    public var url: String {
      switch self {
      case .movieurl(let key): return "\(API.baseUrl)\(key)?api_key=\(API.apikey)"
      }
    }
  }
}
