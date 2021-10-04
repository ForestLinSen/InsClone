//
//  Post.swift
//  InsClone
//
//  Created by Sen Lin on 2/10/2021.
//

import FirebaseFirestoreSwift
import Firebase

struct Post: Identifiable, Decodable{
    @DocumentID var id: String?
    let ownerUid: String
    let ownerUsername: String
    let caption: String
    let likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    let ownerImageUrl: String
    
    var didLike: Bool? = false
}
