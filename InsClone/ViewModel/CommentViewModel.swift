//
//  CommentViewModel.swift
//  InsClone
//
//  Created by Sen Lin on 6/10/2021.
//

import SwiftUI
import Firebase

class CommentViewModel: ObservableObject{
    private let post: Post
    
    init(post: Post) {
        self.post = post
    }
    
    func uploadComment(commentText: String){
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let postId = self.post.id else { return }
        
        let data: [String: Any] = ["username": user.username,
                                   "profileImageUrl": user.profileImageUrl,
                                   "uid": user.id ?? "",
                                   "timestamp": Timestamp(date: Date()),
                                   "postOwnerUid": post.ownerUid,
                                   "commentText": commentText]
        
        Firestore.firestore().collection("posts").document(postId).collection("comments").addDocument(data: data){ error in
            if let error = error{
                print("Debug: error uploading comments: \(error.localizedDescription)")
            }
            
            
        }
    }
    
    func fetchComments(){
        
    }
}
