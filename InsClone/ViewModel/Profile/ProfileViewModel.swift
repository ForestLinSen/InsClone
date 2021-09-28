//
//  ProfileViewModel.swift
//  InsClone
//
//  Created by 林森 on 26/9/2021.
//

import SwiftUI

class ProfileViewModel: ObservableObject{
    @Published var user: User
    
    init(user: User) {
        self.user = user
        checkIfUserFollowed()
    }
    
    func follow(){
        
        guard let id = user.id else {return}
        UserService.follow(uid: id) { _ in
            self.user.isFollowed = true
            print("Debug: follow button clicked")
        }

    }
    
    func unfollow(){
        
        guard let id = user.id else {return}
        UserService.unfollow(uid: id) { _ in
            self.user.isFollowed = false
            print("Debug: unfollow button clicked")
        }
        
    }
    
    func checkIfUserFollowed(){
        guard !user.isCurrentUser else{return}
        guard let id = user.id else {return}
        
        UserService.checkIfUserIsFollowed(uid: id) { result in
            if(result){
                self.user.isFollowed = true
            }else{
                self.user.isFollowed = false
            }
        }

    }
}
