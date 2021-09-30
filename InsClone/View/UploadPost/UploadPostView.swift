//
//  UploadPostView.swift
//  InsClone
//
//  Created by SenLin on 3/8/2021.
//

import SwiftUI

struct UploadPostView: View {
    
    @State private var selectedImage: UIImage?
    @State var postImage: Image?
    @State var caption = ""
    @State var imagePickerPresented = false
    @ObservedObject var viewModel = UploadPostViewModel()
    
    @Binding var selectionIndex: Int
    
    var body: some View {
        
        VStack{
            if(postImage == nil){
                Button(action: {
                    imagePickerPresented.toggle()
                }, label: {
                    Image("addImage")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .clipped()
                }).sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
                    ImagePicker(image: $selectedImage)
                })

            }else if let image = postImage{
                
                HStack(alignment:.top){
                    Button(action: {
                    }, label: {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .clipped()
                    })
                    
                    //TextField("Enter your caption", text: $caption)
                    TextArea(text: $caption, placeholder: "Enter your caption")
                        .frame(height: 125)
                }
                
                
                Button(action: {
                    if let image = selectedImage{
                        viewModel.uploadPost(caption: caption, image: image){ _ in
                            postImage = nil
                            caption = ""
                            selectionIndex = 0
                        }
                    }
                }, label: {
                    Text("Share")
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: 360, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color(.systemBlue))
                        .cornerRadius(5)
                        .foregroundColor(.white)
                })
                .padding()
            }
            
            Spacer()
        }
        .padding()
        
        
    }
}

extension UploadPostView{
    func loadImage(){
        guard let selectedImage = selectedImage else {return}
        postImage = Image(uiImage: selectedImage)
    }
}

//struct UploadPostView_Previews: PreviewProvider {
//    static var previews: some View {
//        UploadPostView()
//    }
//}
