//
//  MainTabView.swift
//  InsClone
//
//  Created by SenLin on 3/8/2021.
//

import SwiftUI

struct MainTabView: View {
    
    let user: User
 
    var body: some View {
        NavigationView {
            TabView{
                FeedView().tabItem {
                    Image(systemName: "house")
                }
                
                SearchView().tabItem {
                    Image(systemName: "magnifyingglass")
                }
                
                UploadPostView().tabItem {
                    Image(systemName: "plus.square")
                }
                
                NotificationView().tabItem {
                    Image(systemName: "heart")
                }
                
                ProfileView(user: user).tabItem {
                    Image(systemName: "person")
                }
                
            }
            .accentColor(.black)
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: logoutButton)
            .accentColor(.black)
        }
    }
    
    var logoutButton: some View{
        Button(action: AuthViewModel.shared.logout, label: {
            Text("Log out")
        })
    }
    
   
}

//struct MainTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainTabView()
//    }
//}
