//
//  Remote.swift
//  MandiriSubmission
//
//  Created by Moh Zinnur Atthufail Addausi on 03/03/21.
//

import Foundation

protocol SourcesRemoteDataSourceProtocol {
    func catchSourcesList(page: Int, key: String, completion: @escaping ((Swift.Result<SourcesModel, Error>) -> Void))
}

class SourcesRemoteDataSource: SourcesRemoteDataSourceProtocol {
    
    func catchSourcesList(page: Int, key: String, completion: @escaping ((Swift.Result<SourcesModel, Error>) -> Void)) {
        
        guard let urlString = ("\(Endpoints.Gets.sources.url)category=\(key)&apiKey=c6bb0e644b134a8aa11e463d99fa915f&page=\(page)") as? String  else {
            return
        }
        
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
        
        URLSession.shared.dataTask(with: request) { (data, _, error)  in
            
            if let error = error {
                print(error)
                return
            }
            guard let data = data else { return }
            
            do {
                let posts = try JSON().newJSONDecoder().decode(SourcesModel.self, from: data)
                completion(.success(posts))
            } catch (let error) {
                
                print(error)
                
            }
            return
            
        }.resume()
        
    }
    
}
