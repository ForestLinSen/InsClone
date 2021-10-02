//
//  FeedCell.swift
//  InsClone
//
//  Created by Sen Lin on 3/8/2021.
//

import SwiftUI
import Kingfisher
import Firebase

struct FeedCell: View {
    
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                KFImage(URL(string: post.ownerImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipped()
                    .cornerRadius(18)
                Text(post.ownerUsername)
                    .font(.system(size: 14, weight: .semibold))
            }
            .padding([.leading, .bottom], 8)
            
            KFImage(URL(string: post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(maxHeight:440)
                .clipped()
            
            HStack(spacing: 16){
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "heart")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                })
                
                Button(action: {}, label: {
                    Image(systemName: "bubble.right")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                })
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "paperplane")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                })
            }
            .padding(.leading, 4)
            .foregroundColor(.black)
            
            
            Text("\(post.likes) likes")
                .font(.system(size: 14, weight: .semibold))
                .padding(.leading, 8)
                .padding(.bottom, 2)
            
            HStack{
                Text(post.ownerUsername).font(.system(size: 14, weight: .semibold)) + Text(" \(post.caption)").font(.system(size:14))
            }
            .padding(.horizontal, 8)
            
            Text("2d")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .padding([.top, .leading], 8)

        }
    }
}

//struct FeedCell_Previews: PreviewProvider {
//    static var previews: some View {
//        FeedCell()
//    }
//}
