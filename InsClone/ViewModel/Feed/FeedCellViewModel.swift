//
//  FeedCellViewModel.swift
//  InsClone
//
//  Created by Sen Lin on 4/10/2021.
//

import SwiftUI
import Firebase

class FeedCellViewModel: ObservableObject{
    @Published var post: Post
    
    var likesLabel: String {
        let label = post.likes > 1 ? "likes" : "like"
        return  "\(post.likes) \(label)"
    }
    
    init(post: Post) {
        self.post = post
        checkIfLiked()
    }
    
    func like(){
        guard let uid = AuthViewModel.shared.userSession?.uid else {return}
        guard let postId = post.id else {return}
        
        Firestore.firestore().collection("posts").document(postId)
            .collection("user-likes").document(uid).setData([:]){ _ in
            
                Firestore.firestore().collection("users").document(uid).collection("user-likes")
                    .document(postId).setData([:])
                
                Firestore.firestore().collection("posts").document(postId).updateData(["likes": self.post.likes+1])
                self.post.likes += 1
                self.post.didLike = true
            
        }
        
        print("Like this post")
    }
    
    func unlike(){
        guard let uid = AuthViewModel.shared.userSession?.uid else {return}
        guard let postId = post.id else {return}
        
        Firestore.firestore().collection("users").document(uid)
            .collection("user-likes").document(postId).delete(){ _ in
                self.post.didLike = false
                self.post.likes -= 1
                Firestore.firestore().collection("posts").document(postId).updateData(["likes": self.post.likes-1])
            }
    }
    
    func checkIfLiked(){
        guard let uid = AuthViewModel.shared.userSession?.uid else {return}
        guard let postId = post.id else {return}
        
        Firestore.firestore().collection("users").document(uid)
            .collection("user-likes").document(postId).getDocument { snapShot, _ in
                if(snapShot?.data() != nil){
                    self.post.didLike = true
                }
        }
    }
}
