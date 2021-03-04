//
//  ArticleView.swift
//  MandiriSubmission
//
//  Created by Moh Zinnur Atthufail Addausi on 03/03/21.
//

import Foundation
import SwiftUI

struct ArticleView: View {
    
    @StateObject var articleVM: ArticleViewModel = ArticleViewModel()
    @State private var isPresenting: Bool = false
    @State private var selectedArticel: String = ""
    @State var searchText = ""
    @State private var isEditing = false
    
    var category: String
    
    var body: some View {
        
        ZStack {
            switch self.articleVM.state {
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
            self.articleVM.fetchArticleExecute(sourcename: category)
        }
    }
    
}
extension ArticleView {
    
    var emptyCategories: some View {
        CustomEmptyView(
            image: "assetNoFavorite",
            title: "The  Article is empty"
        ).offset(y: 80)
    }
    
    var content: some View {
        ScrollView {
            SearchHelper(searchText: $searchText, isEditing: isEditing)
            
            ForEach(self.articleVM.articlelist, id: \.title) { articleResult in
                if articleResult.title.localizedCaseInsensitiveContains(searchText) || searchText == ""{
                    Button(action: {
                        self.selectedArticel = articleResult.url ?? ""
                        self.isPresenting.toggle()
                    }, label: {
                        ArticleRow(data: articleResult)
                    }).sheet(isPresented: $isPresenting, content: {
                        ArticleDetail(isPresenting: self.$isPresenting, url: self.$selectedArticel)
                    })
                }
            }
        }.padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
    }
}
