//
//  PostViewModel.swift
//  InsClone
//
//  Created by Sen Lin on 2/10/2021.
//

import SwiftUI
import Firebase

enum PostGridConfiguration{
    case explore
    case profile(String)
}

class PostViewModel: ObservableObject{
    @Published var posts = [Post]()
    
    init(config: PostGridConfiguration) {
        fetchPosts(forConfig: config)
    }
    
    func fetchPosts(forConfig config: PostGridConfiguration){
        //guard let currentUserId = AuthViewModel.shared.userSession?.uid else {return}
        
        switch config {
        case .explore:
            fetchExplorePagePosts()
        case .profile(let uid):
            fetchUserPosts(forUid: uid)
        }
    }
    
    func fetchExplorePagePosts(){
        Firestore.firestore().collection("posts").getDocuments { snapShot, _ in
            guard let documents = snapShot?.documents else {return}
            self.posts = documents.compactMap {try? $0.data(as: Post.self)}
        }
    }
    
    func fetchUserPosts(forUid uid: String){
        Firestore.firestore().collection("posts").whereField("ownerUid", isEqualTo: uid).getDocuments { snapShot, _ in
            guard let documents = snapShot?.documents else {return}
            self.posts = documents.compactMap{try? $0.data(as: Post.self)}
        }
    }
}
