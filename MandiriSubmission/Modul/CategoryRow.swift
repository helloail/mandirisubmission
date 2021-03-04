//
//  CategoryRow.swift
//  MandiriSubmission
//
//  Created by Moh Zinnur Atthufail Addausi on 03/03/21.
//

import SwiftUI

struct CategoryRow: View {
    let data: CategoryModel
    
    var body: some View {
        VStack {
            content
        }
        .frame(width: UIScreen.main.bounds.width - 32, height: 250)
        .background(Color.gray.opacity(0.3))
        .cornerRadius(30)
    
    }
    
}

extension CategoryRow {
    
    var content: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(data.categoryName ?? "")
                .font(.title)
                .foregroundColor(.black)
                .bold()
            
        }.padding(
            EdgeInsets(
                top: 0,
                leading: 16,
                bottom: 16,
                trailing: 16
            )
        )
    }
    
}
