//
//  imageUploader.swift
//  InsClone
//
//  Created by SenLin on 14/9/2021.
//

import UIKit
import Firebase

struct ImageUploader {
    static func uploadImage(image: UIImage, completion: @escaping (String) -> Void){

        
        guard let imageData = image.jpegData(compressionQuality: 0.75) else{ return }

        
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        ref.putData(imageData, metadata: nil){_, error in
            if let error = error{
                print("DEBUG: failed to upload image \(error.localizedDescription)")
                return
            }
            
            ref.downloadURL{url, _ in
                guard let imageUrl = url?.absoluteString else {
                    print("DEBUG: cannot have image url")
                    return
                }
                
                completion(imageUrl)
            }
            
        }

        
        

    }
}
