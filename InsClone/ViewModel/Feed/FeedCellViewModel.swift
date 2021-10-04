//
//  FeedCellViewModel.swift
//  InsClone
//
//  Created by 林森 on 4/10/2021.
//

import SwiftUI

class FeedCellViewModel: ObservableObject{
    @Published var post: Post
    
    init(post: Post) {
        self.post = post
    }
    
    func like(){
        print("Like this post")
    }
    
    func unlike(){
        print("unfollow this post")
    }
}
