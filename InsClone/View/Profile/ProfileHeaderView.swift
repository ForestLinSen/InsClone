//
//  ProfileView.swift
//  InsClone
//
//  Created by SenLin on 3/8/2021.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    
    let user: User
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                KFImage(URL(string: user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .clipShape(Circle())
                
                Spacer()
                
                HStack(spacing: 20){
                    UserStatView(value: 3, title: "Posts")
                    UserStatView(value: 102, title: "Followers")
                    UserStatView(value: 10, title: "Following")
                }
                .padding(.trailing, 32)
            }
            .padding(.bottom, 10)
            
            Text(user.username).font(.system(size: 14, weight: .semibold))
            Text(user.fullname).font(.system(size: 14))
            
            ProfileActionButton(isCurrentUser: user.isCurrentUser)
                .padding(.top)

        }
        .padding()
        
    }
}


//struct ProfileHeaderView_preview: PreviewProvider {
//    static var previews: some View {
//        ProfileHeaderView()
//    }
//}
