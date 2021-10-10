//
//  uploadViewModel.swift
//  InsClone
//
//  Created by Sen Lin on 8/10/2021.
//

import SwiftUI
import Firebase

class NotificationViewModel: ObservableObject{
    
    init() {
        fetchNotifcation()
    }
    
    @Published var notifications: [Notification] = []
    
    static func uploadNotification(type: NotificationType, post: Post? = nil, toWhom: String){
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let uid = user.id else { return }
                
        var data: [String: Any] = ["username": user.username,
                                   "profileImageUrl": user.profileImageUrl,
                                   "timestamp": Timestamp(date: Date()),
                                   "type": type.rawValue,
                                   "uid": uid]
        
        if let post = post, let postId = post.id{
            guard post.ownerUid == toWhom else { return }
            data["postd"] = postId
        }
        
        Firestore.firestore().collection("notifications").document(toWhom).collection("user-notification").addDocument(data: data)
        
    }
    
    func fetchNotifcation(){
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let uid = user.id else { return }
        
        Firestore.firestore().collection("notifications").document(uid).collection("user-notification").getDocuments { snapShot, _ in
            guard let documents = snapShot?.documents else { return }
            self.notifications = documents.compactMap({ try? $0.data(as: Notification.self)})
        }
    }
}
