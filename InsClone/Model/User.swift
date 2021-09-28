//
//  User.swift
//  InsClone
//
//  Created by SenLin on 18/9/2021.
//

import FirebaseFirestoreSwift

struct User: Decodable, Identifiable{
    @DocumentID var id: String?
    
    let username: String
    let email: String
    let profileImageUrl: String
    let fullname: String
    var isFollowed: Bool? = false
    
    var isCurrentUser: Bool{
        return AuthViewModel.shared.userSession?.uid == id
    }
}
