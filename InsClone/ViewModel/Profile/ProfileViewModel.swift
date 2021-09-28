//
//  ProfileViewModel.swift
//  InsClone
//
//  Created by 林森 on 26/9/2021.
//

import SwiftUI

class ProfileViewModel: ObservableObject{
    let user: User
    
    init(user: User) {
        self.user = user
    }
    
    func follow(){
        
        guard let id = user.id else {return}
        UserService.follow(uid: id) { _ in
            print("Debug: follow button clicked")
        }

    }
    
    func unfollow(){
        
        guard let id = user.id else {return}
        UserService.unfollow(uid: id) { _ in
            print("Debug: unfollow button clicked")
        }
        
    }
    
    func checkIfUserFollowed(){

        guard let id = user.id else {return}
        
        UserService.checkIfUserIsFollowed(uid: id) { result in
            if(result){
                print("Debug: is following")
            }else{
                print("Debug: not following")
            }
        }

    }
}
