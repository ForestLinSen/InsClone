//
//  SearchBar.swift
//  InsClone
//
//  Created by Sen Lin on 3/8/2021.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @Binding var isEditing: Bool
    
    var body: some View {
        HStack {
            TextField("Search...", text: $text)
                .padding(8)
                .padding(.horizontal, 24)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0,
                                   maxWidth: .infinity,
                                   alignment: .leading)
                            .padding(.leading, 8)
                    }
                )
                .onTapGesture {
                    isEditing = true
            }
            
            if(isEditing){
                Button(action: {
                    isEditing = false
                    text = ""
                    UIApplication.shared.endEditing()
                }, label: {
                    Text("Cancel")
                })
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant("Search..."), isEditing: .constant(false))
    }
}
