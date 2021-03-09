//
//  ArticleRemoteDataSource.swift
//  Sources
//
//  Created by Moh Zinnur Atthufail Addausi on 09/03/21.
//

import Foundation
import Alamofire

public protocol ArticleRemoteDataSourceProtocol {
    func catchArticleList(page: Int, key: String, completion: @escaping ((Swift.Result<ArticleModel, Error>) -> Void))
}

public class ArticleRemoteDataSource: ArticleRemoteDataSourceProtocol {
    public init() {
        
    }
    public func catchArticleList(page: Int, key: String, completion: @escaping ((Swift.Result<ArticleModel, Error>) -> Void)) {
        
        let urlString = Endpoints.Gets.article(key: key).url
        
        guard let encoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) else {
            return
        }
        
        guard  let url = URL(string: encoded) else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "Get"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-type")
        
        AF.request(request).validate().responseDecodable(of: ArticleModel.self){ response in
            switch response.result {
            case .success(let value) :
                completion(.success(value))
            case .failure(let error) :
                completion(.failure(error))
                
            }
        }
    }
}
