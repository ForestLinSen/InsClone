//
//  ImagePicker.swift
//  InsClone
//
//  Created by SenLin on 6/8/2021.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var image: UIImage?
    @Environment(\.presentationMode) var mode
    
    // Coordinator
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
        let parent: ImagePicker
        
        init(_ parent: ImagePicker){
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [ UIImagePickerController.InfoKey: Any]){
            guard let uiImage = info[.originalImage] as? UIImage else {return}
            parent.image = uiImage
            self.parent.mode.wrappedValue.dismiss()
        }
        
    }
    
    // UIKit
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    

}
