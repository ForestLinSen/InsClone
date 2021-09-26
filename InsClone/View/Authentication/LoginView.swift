//
//  LoginView.swift
//  InsClone
//
//  Created by SenLin on 8/8/2021.
//

import SwiftUI

struct LoginView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack(spacing: 15){
                    Image("instagram")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 228, height: 100)
                        .foregroundColor(.white)
                    
                    CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .padding(.horizontal, 32)
                    
                    CustomSecureField(text: $password, placeholder: Text("Password"), imageName: "lock")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .padding(.horizontal, 32)
                    
                    HStack{
                        Spacer()
                        
                        Text("Forget Password?")
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundColor(.white)
                            .padding(.trailing, 32)
                    }
                    
                    Button(action: {
                        viewModel.login(email: email, password: password)
                    }, label: {
                        Text("Sign In")
                            .font(.headline)
                            .frame(width: 320, height: 50)
                            .foregroundColor(.white)
                            .background(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
                            .clipShape(Capsule())
                            .padding(.top)

                    })
                    
                    Spacer()
                    
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            NavigationLink(
                                destination: RegistrationView()
                                    .navigationBarHidden(true),
                                label: {
                                    
                                    HStack{
                                        Text("Don't have an account?")
                                            .font(.system(size:13))
                                            .foregroundColor(.white)
                                        
                                        Text("Sign up")
                                            .font(.system(size: 13, weight: .semibold))
                                            .foregroundColor(.white)
                                    }

                                })
                            

                        
                    })
                    

                }
            }
        
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(email: "", password: "")
    }
}
