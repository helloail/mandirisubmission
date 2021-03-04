//
//  SourcesViewModel.swift
//  MandiriSubmission
//
//  Created by Moh Zinnur Atthufail Addausi on 03/03/21.
//

import Foundation

class SourcesViewModel: ObservableObject {
    
    private var sourcesservice: SourcesRemoteDataSourceProtocol
    @Published private(set) var state = LoadedStateHelper.idle
    @Published var sourcelist = [Source]()
    
    init(sourcesservice: SourcesRemoteDataSourceProtocol = SourcesRemoteDataSource() ) {
        
        self.sourcesservice  = sourcesservice
        
    }
    
    func fetchSourceExecute(sourcename: String) {
        
        self.sourcesservice.catchSourcesList(key: sourcename) { [weak self] result in
            
            switch result {
            
            case .success(let result) :
                
                DispatchQueue.main.async {
                
                    guard let data = result.sources else {
                        return
                    }
                    
                    self?.sourcelist = data
                    
                    if (self?.sourcelist.count)! < 1 {
                        self?.state = .empty
                    } else {
                        self?.state = .loaded
                    }
                }
                
            case .failure(let error):
                
                self?.state = .error(error)
                
            }
        }
    }
}
