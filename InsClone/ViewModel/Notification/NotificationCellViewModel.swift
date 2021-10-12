//
//  NotificationCellViewModel.swift
//  InsClone
//
//  Created by Sen Lin on 10/10/2021.
//

import SwiftUI
import Firebase

class NotificationCellViewModel: ObservableObject{
    @Published var notification: Notification
    
    init(notification: Notification){
        self.notification = notification
        fetchNotification()
    }
    
    func fetchNotification(){
        guard let postId = notification.postId else { return }
        Firestore.firestore().collection("posts").document(postId).getDocument { snapShot, _ in
            self.notification.post = try? snapShot?.data(as: Post.self)
        }
    }
}
