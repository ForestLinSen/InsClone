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
        print("Debug: follow button clicked")
    }
    
    func unfollow(){
        print("Debug: unfollow button clicked")
    }
    
    func checkIfUserFollowed(){
        
    }
}
