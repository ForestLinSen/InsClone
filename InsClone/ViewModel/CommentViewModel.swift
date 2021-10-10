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
    @Published var comments: [Comment] = []
    
    init(post: Post) {
        self.post = post
        fetchComments()
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
            
            NotificationViewModel.uploadNotification(type: .comment, post: self.post, toWhom: self.post.ownerUid)
            
            //self.fetchComments()
            
        }
    }
    
    
    func fetchComments(){
        guard let postId = self.post.id else { return }
        
        let query = Firestore.firestore().collection("posts").document(postId).collection("comments").order(by: "timestamp", descending: true)
        
        query.addSnapshotListener { snapShot, _ in
            guard let addedDocs = snapShot?.documentChanges.filter({$0.type == .added}) else { return }
            self.comments.append(contentsOf: addedDocs.compactMap({try? $0.document.data(as: Comment.self)}))
        }
        
//        Firestore.firestore().collection("posts").document(postId).collection("comments").getDocuments { snapShot, _ in
//            guard let documents = snapShot?.documents else { return }
//            self.comments = documents.compactMap({try? $0.data(as: Comment.self)})
//        }
        
        
    }
}
