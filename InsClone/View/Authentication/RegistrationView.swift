//
//  RegistrationView.swift
//  InsClone
//
//  Created by SenLin on 8/8/2021.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email: String = ""
    @State private var fullname: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @Environment(\.presentationMode) var mode
    
    @State private var selectedImage: UIImage?
    @State var postImage: Image?
    @State var imagePickerPresented = false
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing: 15){
                
                if let image = postImage{
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .clipShape(Circle())
                        .padding()
                }else{
                    Button(action: {
                        imagePickerPresented.toggle()
                    }, label: {
                        Image("addImage")
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 180, height: 180)
                            .foregroundColor(Color(.init(white: 1.0, alpha: 0.8)))
                            .clipped()
                    })
                    .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
                        ImagePicker(image: $selectedImage)
                    })
                    .padding()
                }
                
                
                
                CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                    .padding()
                    .background(Color(.init(white: 1, alpha: 0.15)))
                    .cornerRadius(10)
                    .padding(.horizontal, 32)
                
                CustomTextField(text: $username, placeholder: Text("Username"), imageName: "person.circle")
                    .padding()
                    .background(Color(.init(white: 1, alpha: 0.15)))
                    .cornerRadius(10)
                    .padding(.horizontal, 32)
                
                CustomTextField(text: $fullname, placeholder: Text("Full Name"), imageName: "person")
                    .padding()
                    .background(Color(.init(white: 1, alpha: 0.15)))
                    .cornerRadius(10)
                    .padding(.horizontal, 32)
                
                CustomSecureField(text: $password, placeholder: Text("Password"), imageName: "lock")
                    .padding()
                    .background(Color(.init(white: 1, alpha: 0.15)))
                    .cornerRadius(10)
                    .padding(.horizontal, 32)
                
                
                Button(action: {
                    
                    if let image = selectedImage{
                        
                        viewModel.register(withEmail: email, password: password, image: image, fullname: fullname, username: username)
                    }

                }, label: {
                    Text("Sign Up")
                        .font(.headline)
                        .frame(width: 320, height: 50)
                        .foregroundColor(.white)
                        .background(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
                        .clipShape(Capsule())
                        .padding(.top)

                })
                
                Spacer()
                
  
                Button(action: {
                    mode.wrappedValue.dismiss()
                }, label: {
                    HStack{
                        Text("Already have an account?")
                            .font(.system(size:13))
                            .foregroundColor(.white)
                        

                        Text("Sign in")
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundColor(.white)


                    }
                })
                

            }
    }
}

}

extension RegistrationView{
    func loadImage(){
        guard let selectedImage = selectedImage else {return}
        postImage = Image(uiImage: selectedImage)
    }
}
    
struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}

