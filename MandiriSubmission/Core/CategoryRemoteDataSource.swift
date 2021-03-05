//
//  CategoryRemoteDataSource.swift
//  MandiriSubmission
//
//  Created by Moh Zinnur Atthufail Addausi on 03/03/21.
//

import Foundation

protocol CategoryRemoteDataSourceProtocol {
    func catchCategoryList(completion: @escaping ((Swift.Result<[CategoryModel], Error>) -> Void))
}

class CategoryRemoteDataSource: CategoryRemoteDataSourceProtocol {
    
    func catchCategoryList( completion: @escaping ((Swift.Result< [CategoryModel], Error>) -> Void)) {
        
        guard let path = Bundle.main.url(forResource: "Category", withExtension: "json") else { return }
        do {
            let data = try Data(contentsOf: path)
            
            let posts =  try JSON().newJSONDecoder().decode([CategoryModel].self, from: data)
            completion(.success(posts))
            
        } catch {
            print("error:\(error)")
        }
        
    }
}
