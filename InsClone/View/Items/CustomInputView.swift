//
//  CustomInputView.swift
//  InsClone
//
//  Created by Sen Lin on 6/10/2021.
//

import SwiftUI

struct CustomInputView: View {
    
    @Binding var inputText: String
    var action: (String) -> Void
    
    var body: some View {
        
        VStack{
            Rectangle()
                .foregroundColor(Color(.separator))
                .frame(width: UIScreen.main.bounds.width, height: 0.75)
            
            HStack{
                TextField("Comment...", text: $inputText)
                    .font(.system(size: 13))
                
                Button(action: {
                    action(inputText)
                    UIApplication.shared.endEditing()
                    inputText = ""
                    
                }, label: {
                    Text("Send")
                })
            }
            .padding(.init(top: 8, leading: 16, bottom: 16, trailing: 16))
        }
    }
}

//struct CustomInputView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomInputView(inputText: .constant(""), action: {})
//    }
//}
