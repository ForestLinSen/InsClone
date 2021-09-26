//
//  ProfileActionButton.swift
//  InsClone
//
//  Created by SenLin on 5/8/2021.
//

import SwiftUI

struct ProfileActionButton: View {
    var isCurrentUser: Bool
    var isFollowing: Bool = false
    
    var body: some View {
        HStack {
            Spacer()
            
            if(isCurrentUser){
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Edit Profile")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 360, height: 32, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                })
            }else{
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text(isFollowing ? "Following" : "Follow")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 172, height: 32, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(isFollowing ? Color(.white) : Color(.systemBlue))
                        .foregroundColor(isFollowing ? Color(.black) : Color(.white))
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                })
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Message")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 172, height: 32, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                })
            }
            

            Spacer()
        }
    }
}

//struct ProfileActionButton_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileActionButton()
//    }
//}
