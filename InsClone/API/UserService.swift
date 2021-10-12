//
//  UserService.swift
//  InsClone
//
//  Created by Sen Lin on 27/9/2021.
//

import Firebase

struct UserService{
    static func follow(uid: String, completion: (((Error?) -> Void)?)){
        guard let currentUserId = AuthViewModel.shared.userSession?.uid else{return}
        
        // collection inside the user
        Firestore.firestore().collection("following").document(currentUserId)
            .collection("user-following").document(uid).setData([:]){_ in
                
                // simultaneously set the followers
                Firestore.firestore().collection("followers").document(uid)
                    .collection("user-followers").document(currentUserId).setData([:], completion: completion)
            }
    }
    
    static func unfollow(uid: String, completion: ((Error?) -> Void)?){
        guard let currentUserId = AuthViewModel.shared.userSession?.uid else {return}
        
        // delete the following document
        Firestore.firestore().collection("following").document(currentUserId)
            .collection("user-following").document(uid).delete{ _ in
                
                // delete the follower document
                Firestore.firestore().collection("followers").document(uid)
                    .collection("user-followers").document(currentUserId).delete(completion: completion)
            }
    }
    
    
    static func checkIfUserIsFollowed(uid: String, completion: @escaping ((Bool) -> Void)){
        guard let currentUserId = AuthViewModel.shared.userSession?.uid else{return}
        
        Firestore.firestore().collection("following").document(currentUserId)
            .collection("user-following").document(uid).getDocument(completion: { snapShot, _ in
                
                if((snapShot?.data()) != nil){
                    completion(true)
                }else{
                    completion(false)
                }
            })
    }
    
    static func getPostImage(postId: String, completion: @escaping (String)->Void){
        Firestore.firestore().collection("posts").document(postId).getDocument { snapShot, _ in
            guard let document = snapShot?.data() else { return }
            completion(document["imageUrl"] as! String)
        }
    }

}
