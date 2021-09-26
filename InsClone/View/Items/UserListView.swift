//
//  UserListView.swift
//  InsClone
//
//  Created by SenLin on 3/8/2021.
//

import SwiftUI

struct UserListView: View {
    
    @ObservedObject var viewModel: SearchViewModel
    @Binding var searchText: String
    
    var users: [User] {
        return searchText.isEmpty ? viewModel.users : viewModel.filteredUsers(searchText)
    }
    
    var body: some View {
        ScrollView{
            LazyVStack{
                ForEach(users){user in
                    NavigationLink(
                        destination: ProfileView(user: user),
                        label: {
                            UserCell(user: user)
                        })

                }
            }
            .padding(.leading)
        }
    }
}
