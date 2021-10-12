//
//  Notification.swift
//  InsClone
//
//  Created by 林森 on 8/10/2021.
//

import Firebase
import FirebaseFirestoreSwift

struct Notification: Identifiable, Decodable{
    @DocumentID var id: String?
    var postId: String?
    //var postImageUrl: String?
    let username: String
    let profileImageUrl: String
    let timestamp: Timestamp
    let type: NotificationType
    let uid: String
    var post: Post?
}

enum NotificationType: Int, Decodable{
    case like
    case comment
    case follow
    var notificationMessage: String{
        switch self {
        case .like:
            return " liked one of your posts."
        case .comment:
            return " commented on one of your posts."
        case .follow:
            return " started following you."
            
        }
    }
}
