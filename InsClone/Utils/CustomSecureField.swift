//
//  CustomSecureField.swift
//  InsClone
//
//  Created by SenLin on 8/8/2021.
//

import SwiftUI

struct CustomSecureField: View {
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
                
                SecureField("", text: $text)
            }
        }
        
    }
}
