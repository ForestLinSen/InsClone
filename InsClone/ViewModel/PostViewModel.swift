//
//  PostViewModel.swift
//  InsClone
//
//  Created by 林森 on 2/10/2021.
//

import SwiftUI
import Firebase

class PostViewModel: ObservableObject{
    @Published var posts = [Post]()
    
    init() {
        fetchPost()
    }
    
    func fetchPost(){
        //guard let currentUserId = AuthViewModel.shared.userSession?.uid else {return}
        
        Firestore.firestore().collection("posts").getDocuments { snapShot, _ in
            guard let documents = snapShot?.documents else {return}
            self.posts = documents.compactMap {try? $0.data(as: Post.self)}
            
            for post in self.posts{
                print("Debug: \(post.caption)")
            }
            
        }
    }
}
