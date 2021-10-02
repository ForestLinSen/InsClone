//
//  CustomTextField.swift
//  InsClone
//
//  Created by Sen Lin on 8/8/2021.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    let placeholder: Text
    let imageName: String
    
    var body: some View {
        
        ZStack(alignment: .leading){
            if text.isEmpty{
                placeholder
                    .foregroundColor(Color(.init(white: 1.0, alpha: 0.8)))
                    .padding(.leading, 40)
                    .font(.system(size: 14))
            }
            
            HStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                
                TextField("", text: $text)
            }
        }
        
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(text: .constant(""), placeholder: Text("Email"), imageName: "envelope")
    }
}
