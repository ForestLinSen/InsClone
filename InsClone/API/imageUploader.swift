//
//  imageUploader.swift
//  InsClone
//
//  Created by SenLin on 14/9/2021.
//

import UIKit
import Firebase

enum UploadType{
    case profile
    case post
    
    var filePath: StorageReference{
        let filename = NSUUID().uuidString
        
        switch self{
        case .profile:
            return Storage.storage().reference(withPath: "/profile_images/\(filename)")
        case .post:
            return Storage.storage().reference(withPath: "/post_images/\(filename)")
        }
    }
}

struct ImageUploader {
    static func uploadImage(image: UIImage, type: UploadType, completion: @escaping (String) -> Void){

        
        guard let imageData = image.jpegData(compressionQuality: 0.75) else{ return }

        let ref = type.filePath
        
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
