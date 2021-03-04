//
//  CatogoryView.swift
//  MandiriSubmission
//
//  Created by Moh Zinnur Atthufail Addausi on 03/03/21.
//

import Foundation
import SwiftUI

struct CategoryViews: View {
    
    @ObservedObject var categoryVM: CategoryViewModel = CategoryViewModel()
    
    var body: some View {
        
        ZStack {
            switch self.categoryVM.state {
            case .idle, .loading :
                LoadingIndicator()
            case .error(let error):
                Text("Error \(error.localizedDescription)")
            case .loaded:
                VStack {
                    content
                }
            case .empty:
                Text("")
            }
            
        }.onAppear {
            self.categoryVM.fetchCategoryExecute()
        }
    }
    
}

extension CategoryViews {
    
    var content: some View {
        ScrollView {
            ForEach(self.categoryVM.categorylist, id: \.categoryName) { categoryResult in
                NavigationLink(destination: SourcesViews(category: categoryResult.categoryName ?? "")) {
                    CategoryRow(data: categoryResult)
                        .onAppear { self.listItemAppears(categoryResult) }
                }.buttonStyle(PlainButtonStyle())
            }.padding(.top, 16)
        }
    }
}

extension CategoryViews {
    
    func listItemAppears<Item: Identifiable>(_ item: Item) {
        if categoryVM.categorylist.isLastItem(item) {
            print("last")
        }
    }
}
