//
//  CategoryViewModel.swift
//  MandiriSubmission
//
//  Created by Moh Zinnur Atthufail Addausi on 03/03/21.
//

import Foundation
import SwiftUI

class CategoryViewModel: ObservableObject {
    
    private var categoryservice: CategoryRemoteDataSourceProtocol
    @Published private(set) var state = LoadedStateHelper.idle
    @Published var categorylist = [CategoryModel]()
    
    init(categoryservice: CategoryRemoteDataSourceProtocol = CategoryRemoteDataSource() ) {
        
        self.categoryservice  = categoryservice
        
    }
    
    func fetchCategoryExecute() {
        
        self.categoryservice.catchCategoryList { [weak self] result in
            
            switch result {
            
            case .success(let result) :
                
                self?.categorylist = result
                
                self?.state = .loaded
                
            case .failure(let error):
                
                self?.state = .error(error)
                
            }
        }
    }
    
}
