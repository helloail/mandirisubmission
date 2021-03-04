//
//  SearchHelper.swift
//  MandiriSubmission
//
//  Created by Moh Zinnur Atthufail Addausi on 03/03/21.
//

import SwiftUI

struct searchhelper: View {
    
    @Binding var searchText : String
    @State var isEditing = false
    
    var body: some View {
        HStack{
            TextField("Search", text: $searchText)
                .font(.title3)
                .padding(EdgeInsets(top: 8, leading: 30, bottom: 8, trailing: 20))
                .background(Color(#colorLiteral(red: 0.9645187259, green: 0.9649179578, blue: 0.9559617639, alpha: 1)))
                .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        if isEditing {
                            Button(action: {
                                self.searchText = ""
                                
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .onTapGesture {
                    self.isEditing = true
                }
            
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.searchText = ""
                    
                    // Dismiss the keyboard
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
                .foregroundColor(.gray)
            }
        }
        
    }
}

