//
//  ArticleDetail.swift
//  MandiriSubmission
//
//  Created by Moh Zinnur Atthufail Addausi on 03/03/21.
//

import SwiftUI

struct ArticleDetail: View {
    @Binding var isPresenting: Bool
    @Binding var url: String
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Button(action: {
                self.isPresenting = false
                
            }, label: {
                HStack {
                    Image(systemName: "xmark")
                    Text("Close")
                }
            })
            
            Divider()
            WebViewLoader(url: url)
        }.padding()
        
    }
}
