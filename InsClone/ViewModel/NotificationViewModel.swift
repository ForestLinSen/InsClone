//
//  uploadViewModel.swift
//  InsClone
//
//  Created by Sen Lin on 8/10/2021.
//

import SwiftUI
import Firebase

class NotificationViewModel: ObservableObject{
    @Published var notifications: [Notification] = []
    
    static func uploadNotification(type: NotificationType, post: Post? = nil){
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let uid = user.id else { return }
                
        var data: [String: Any] = ["username": user.username,
                                   "profileImageUrl": user.profileImageUrl,
                                   "timestamp": Timestamp(date: Date()),
                                   "type": type.rawValue,
                                   "uid": uid]
        
        if let post = post, let postId = post.id{
            data["postd"] = postId
        }
        
        Firestore.firestore().collection("notifications").document(uid).collection("user-notification").addDocument(data: data)
        
    }
    
    func fetchNotifcation(){
        
    }
}
