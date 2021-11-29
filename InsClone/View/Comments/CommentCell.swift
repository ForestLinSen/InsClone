//
//  CommentCell.swift
//  InsClone
//
//  Created by Sen Lin on 5/10/2021.
//

import SwiftUI
import Kingfisher

struct CommentCell: View {
    
    let comment: Comment
    
    var body: some View {
        
        HStack(){
            KFImage(URL(string: comment.profileImageUrl))
                .resizable()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
            
            Text(comment.username)
                .font(.system(size: 14, weight: .semibold)) +
                Text(" \(comment.commentText)")
                .font(.system(size: 14))
            
            Spacer()
            
            Text(" \(convertTimeStamp(comment.timestamp))")
                .font(.system(size: 14))
                .foregroundColor(.gray)
        }
        .padding(.horizontal, 8)
        
        
    }
}

//struct CommentCell_Previews: PreviewProvider {
//    static var previews: some View {
//        CommentCell()
//    }
//}
