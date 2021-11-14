//
//  NotificationViewCell.swift
//  InsClone
//
//  Created by Sen Lin on 4/8/2021.
//

import SwiftUI
import Kingfisher

struct NotificationViewCell: View {
    
    @ObservedObject var viewModel: NotificationCellViewModel
    
    @State var showPostImage: Bool = true
    
    init(notification: Notification){
        self.viewModel = NotificationCellViewModel(notification: notification)
    }
    
    var body: some View {
        HStack{
            
            if let post = viewModel.notification.post{
                NavigationLink {
                    FeedCell(post: post)
                } label: {
                    KFImage(URL(string: viewModel.notification.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .clipShape(Circle())
                    
                    Text(viewModel.notification.username)
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text(viewModel.notification.type.notificationMessage)
                        .font(.system(size: 15))
                }
            }else if let user = viewModel.notification.user{
                    NavigationLink{
                        ProfileView(user: user)
                    } label: {
                        KFImage(URL(string: viewModel.notification.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .clipShape(Circle())
                        
                        Text(viewModel.notification.username)
                            .font(.system(size: 14, weight: .semibold))
                        
                        Text(viewModel.notification.type.notificationMessage)
                            .font(.system(size: 15))
                    }
                }
            

            Spacer()
            
            if(viewModel.notification.type != .follow){
                if let post = viewModel.notification.post{
                    KFImage(URL(string: post.imageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .clipped()
                }
            }else{
                
                if let isFollowed = viewModel.notification.isFollowed{
                    Button(action: {
                        if(!isFollowed){
                            UserService.follow(uid: viewModel.notification.uid) { _ in
                                viewModel.notification.isFollowed = true
                            }
                            
                        }
                    }, label: {
                        Text(isFollowed ? "Following" : "Follow")
                            .font(.system(size: 14))
                            .foregroundColor(Color(.white))
                            
                    })
                    .frame(width: 110, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(isFollowed ? Color(.systemGray) : Color(.systemBlue))
                    .clipShape(Capsule())
                }

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
