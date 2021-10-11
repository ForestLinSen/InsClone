//
//  NotificationCellViewModel.swift
//  InsClone
//
//  Created by Sen Lin on 10/10/2021.
//

import SwiftUI

class NotificationCellViewModel: ObservableObject{
    @Published var notification: Notification
    
    init(notification: Notification){
        self.notification = notification
        //fetchImage()
    }
    
//    func fetchImage(){
//
//        guard let postId = self.notification.postId else { return }
//
//        print("Debug: begin to fetch image for notification")
//
//        UserService.getPostImage(postId: postId) { imageUrl in
//            self.imageUrl = imageUrl
//            print("Debug: image for notification: \(self.imageUrl)")
//        }
//    }
}
