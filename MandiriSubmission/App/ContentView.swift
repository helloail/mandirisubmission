//
//  ContentView.swift
//  MandiriSubmission
//
//  Created by Moh Zinnur Atthufail Addausi on 03/03/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            CategoryViews()
                .navigationBarTitleDisplayMode(.inline)
             
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
