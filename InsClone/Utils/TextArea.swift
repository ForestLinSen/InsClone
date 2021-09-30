//
//  TextArea.swift
//  InsClone
//
//  Created by 林森 on 30/9/2021.
//

import SwiftUI

struct TextArea: View{
    @Binding var text: String
    let placeholder: String
    
    init(text: Binding<String>, placeholder: String) {
        self._text = text
        self.placeholder = placeholder
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View{
        ZStack(alignment: .topLeading){
            
            if(text.isEmpty){
                Text(placeholder)
                    .foregroundColor(Color(UIColor.placeholderText))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
                    
            }
            
            TextEditor(text: $text)
                .padding(4)
        }
        .font(.body)
    }
}


//struct TextArea_Previews: PreviewProvider {
//    @State static var caption = ""
//
//    static var previews: some View {
//        TextArea(text: $caption, placeholder: "placeholder")
//    }
//}
