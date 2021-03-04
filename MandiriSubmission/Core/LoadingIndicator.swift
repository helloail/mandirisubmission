//
//  LoadingIndicator.swift
//  MandiriSubmission
//
//  Created by Moh Zinnur Atthufail Addausi on 03/03/21.
//

import Foundation
import SwiftUI

struct LoadingIndicator: View {
    
    var body: some View {
        VStack {
            LoaderIndicatorHelper()
            Text("Loading...")
                .foregroundColor(Color("text"))
            
        }
    }
}
