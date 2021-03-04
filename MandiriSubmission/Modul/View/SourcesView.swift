//
//  SourcesView.swift
//  MandiriSubmission
//
//  Created by Moh Zinnur Atthufail Addausi on 03/03/21.
//

import Foundation
import SwiftUI

struct SourcesViews: View {
    
    @ObservedObject var sourcesVM: SourcesViewModel = SourcesViewModel()
    @State var searchText = ""
    @State private var isEditing = false
    var category : String
    
    var body: some View {
        
        ZStack {
            switch self.sourcesVM.state {
            case .idle, .loading :
                LoadingIndicator()
            case .error(let error):
                Text("Error \(error.localizedDescription)")
            case .loaded:
                VStack {
                    content
                }
            case .empty:
                VStack {
                    emptyCategories
                }
            }
            
        }.onAppear {
            self.sourcesVM.fetchSourceExecute(sourcename: category)
        }
    }
}

extension SourcesViews {
    
    var emptyCategories: some View {
        CustomEmptyView(
            image: "assetNoFavorite",
            title: "The Source Article is empty"
        ).offset(y: 80)
    }
    
    var content: some View {
        ScrollView {
            searchhelper(searchText: $searchText, isEditing: isEditing)
            
            ForEach(self.sourcesVM.sourcelist, id: \.id) { sourceResult in
                
                if sourceResult.name.localizedCaseInsensitiveContains(searchText) || searchText == ""{
                    NavigationLink(destination: ArticleView(category: sourceResult.id )){
                        SourceRow(data: sourceResult).onAppear
                        { self.listItemAppears(sourceResult) }
                    }
                }
            }
        }.animation(.spring(response: 0.4, dampingFraction: 0.8))
        .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
        
    }
    
}
extension SourcesViews {
    
    func listItemAppears<Item: Identifiable>(_ item: Item) {
        if sourcesVM.sourcelist.isLastItem(item){
            print("last")
        }
    }
}

extension RandomAccessCollection where Self.Element: Identifiable {
    func isLastItem<Item: Identifiable>(_ item: Item) -> Bool {
        guard !isEmpty else {
            return false
        }
        
        guard let itemIndex = firstIndex(where: { $0.id.hashValue == item.id.hashValue }) else {
            return false
        }
        
        let distance = self.distance(from: itemIndex, to: endIndex)
        return distance == 1
    }
}
