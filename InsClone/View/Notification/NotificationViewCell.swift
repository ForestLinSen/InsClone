//
//  NotificationViewCell.swift
//  InsClone
//
//  Created by Sen Lin on 4/8/2021.
//

import SwiftUI
import Kingfisher

struct NotificationViewCell: View {
    
    @State var showPostImage: Bool = true
    
    let notification: Notification
    
    var body: some View {
        HStack{
            KFImage(URL(string: notification.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .clipShape(Circle())
            
            Text(notification.username)
                .font(.system(size: 14, weight: .semibold))
            
            Text(NotificationType(rawValue: notification.type)?.notificationMessage ?? "")
                .font(.system(size: 15))
            
            Spacer()
            
            if(showPostImage){
                KFImage(URL(string: notification.profileImageUrl))
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

//struct NotificationViewCell_Previews: PreviewProvider {
//    static var previews: some View {
//        NotificationViewCell()
//    }
//}
