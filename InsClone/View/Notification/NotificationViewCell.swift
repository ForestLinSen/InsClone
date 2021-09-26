//
//  NotificationViewCell.swift
//  InsClone
//
//  Created by SenLin on 4/8/2021.
//

import SwiftUI

struct NotificationViewCell: View {
    
    @State var showPostImage: Bool = true
    
    var body: some View {
        HStack{
            Image("ironMan")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .clipShape(Circle())
            
            Text("Iron Man")
                .font(.system(size: 14, weight: .semibold))
            
            Text("liked one of your posts")
                .font(.system(size: 15))
            
            Spacer()
            
            if(showPostImage){
                Image("ironMan")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .clipped()
            }else{
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Follow")
                        .font(.system(size: 14))
                        .foregroundColor(Color(.white))
                        
                })
                .frame(width: 110, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Color(.systemBlue))
                .clipShape(Capsule())
            }

        }
        .padding(.horizontal, 8)
    }
}

struct NotificationViewCell_Previews: PreviewProvider {
    static var previews: some View {
        NotificationViewCell()
    }
}
