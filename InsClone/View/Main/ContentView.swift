//
//  ContentView.swift
//  InsClone
//
//  Created by Sen Lin on 2/8/2021.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    @State var selectedIndex = 0
    
    var body: some View {
        
        Group{
            if viewModel.userSession == nil {
                LoginView()
            }else{
                
                if let user = viewModel.currentUser{
                    MainTabView(selectionIndex: $selectedIndex, user: user)
                }
            }
        }

    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
