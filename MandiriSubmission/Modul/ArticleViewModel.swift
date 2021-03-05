//
//  ArticleViewModel.swift
//  MandiriSubmission
//
//  Created by Moh Zinnur Atthufail Addausi on 03/03/21.
//

import Foundation

class ArticleViewModel: ObservableObject {
    
    private var articleservice: ArticleRemoteDataSourceProtocol
    @Published private(set) var state = LoadedStateHelper.idle
    @Published var articlelist = [Articles]()
    @Published var url = ""
    @Published var page = 1
    
    init(articleservice: ArticleRemoteDataSourceProtocol = ArticleRemoteDataSource() ) {
        
        self.articleservice  = articleservice
        
    }
    
    func fetchArticleExecute(sourcename: String) {
        
        self.articleservice.catchArticleList(page: page, key: sourcename) { [weak self] result in
            
            switch result {
            
            case .success(let result) :
           
                DispatchQueue.main.async {
                    guard let data = result.articles else {
                        return
                    }
                    self?.articlelist = data
                    
                    if (self?.articlelist.count)! < 1 {
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
