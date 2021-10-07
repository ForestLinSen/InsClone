//
//  Comment.swift
//  InsClone
//
//  Created by 林森 on 6/10/2021.
//

import Firebase
import FirebaseFirestoreSwift

struct Comment: Decodable, Identifiable {
    @DocumentID var id: String?
    
    let commentText: String
    let postOwnerUid: String
    let profileImageUrl: String
    let timestamp: Timestamp
    let uid: String
    let username: String
}
