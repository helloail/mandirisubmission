//
//  ArticleRow.swift
//  MandiriSubmission
//
//  Created by Moh Zinnur Atthufail Addausi on 03/03/21.
//

import Foundation
import SwiftUI
import Sources

struct ArticleRow: View {
    let data: Articles
    
    var body: some View {
        VStack {
           content
            
        }
        
    }
    
}

extension ArticleRow {
    var content: some View {
        VStack(alignment: .leading) {
            
            HStack {
                VStack(alignment: .leading) {
                    Text(data.title )
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    Text(data.publishedAt ?? "")
                        .font(.caption2)
                        .foregroundColor(.gray)
                        .padding(.bottom, 10)
                }
                                
            }
            
            Text(data.articleDescription ?? "")
                .font(.caption2)
                .foregroundColor(.gray)
                .padding(.bottom, 10)
            
            Text("-\(data.author ?? "")-")
                .font(.caption)
                .foregroundColor(.gray)
            
            Divider()
        }
    }
}
