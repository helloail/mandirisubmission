//
//  SourcesRow.swift
//  MandiriSubmission
//
//  Created by Moh Zinnur Atthufail Addausi on 03/03/21.
//

import Foundation
import SwiftUI

struct SourceRow: View {
    let data: Source
    
    var body: some View {
        VStack {
            content
            
        }
        
    }
    
}

extension SourceRow {
    var content: some View {
        VStack(alignment: .leading) {
            
            Text(data.name)
                .font(.headline)
                .foregroundColor(.black)
            
            Text(data.url ?? "")
                .font(.caption)
                .bold()
                .foregroundColor(.black)
            
            Text(data.sourceDescription ?? "")
                .font(.caption)
                .foregroundColor(.gray)
            
            Divider()
        }
    }
}
