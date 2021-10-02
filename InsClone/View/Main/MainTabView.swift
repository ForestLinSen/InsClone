//
//  MainTabView.swift
//  InsClone
//
//  Created by Sen Lin on 3/8/2021.
//

import SwiftUI

struct MainTabView: View {
    @Binding var selectionIndex: Int
    let user: User
 
    var body: some View {
        NavigationView {
            TabView(selection: $selectionIndex){
                FeedView().tabItem {
                    Image(systemName: "house")
                }.tag(0)
                
                SearchView().tabItem {
                    Image(systemName: "magnifyingglass")
                }.tag(1)
                
                UploadPostView(selectionIndex: $selectionIndex).tabItem {
                    Image(systemName: "plus.square")
                }.tag(2)
                
                NotificationView().tabItem {
                    Image(systemName: "heart")
                }.tag(3)
                
                ProfileView(user: user).tabItem {
                    Image(systemName: "person")
                }.tag(4)
                
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
