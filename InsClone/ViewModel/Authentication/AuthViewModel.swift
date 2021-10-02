//
//  AuthViewModel.swift
//  InsClone
//
//  Created by Sen Lin on 10/8/2021.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject{
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    static let shared = AuthViewModel()
    
    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func login(email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error{
                print("Debug: login error: \(error.localizedDescription)")
            }else{
                
                guard let user = result?.user else {
                    print("Debug: cannot login with this user")
                    return
                }
                
                self.userSession = user
                self.fetchUser()
            }
        }
    }
    
    func logout(){
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    func fetchUser(){
        
        guard let currentUser = self.userSession else{
            return
        }
        
        COLLECTION_USERS.document(currentUser.uid).getDocument { snapShot, error in
            if let error = error{
                print("Debug: get document error: \(error.localizedDescription)")
            }
            
            guard let user = try? snapShot?.data(as: User.self) else{return}
            self.currentUser = user
            
            print("Debug: user is \(user)")
        }
    }
    
    func register(withEmail email: String, password: String,
                  image: UIImage, fullname: String, username: String){
        
        print("Debug: begin to register user")
        
        ImageUploader.uploadImage(image: image, type: .profile) { imageUrl in
            
            print("Debug: user image uploaded")
            
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                
                print("Debug: user created")
                
                if let error = error{
                    print(error.localizedDescription)
                    return
                }
                
                guard let user = result?.user else{
                    print("Debug: user create error")
                    return
                }

                print("Successfully register user")
                
                let data = ["email": email,
                            "username": username,
                            "fullname": fullname,
                            "profileImageUrl": imageUrl,
                            "uid": user.uid]

                
                COLLECTION_USERS.document(user.uid).setData(data){error in
                    
                    print("Debug: begin to upload user data")
                    
                    if let e = error{
                        print(e.localizedDescription)
                    }
                    
                    self.userSession = user
                    self.fetchUser()
                }
            }
        }
        
        
    }
    
}
