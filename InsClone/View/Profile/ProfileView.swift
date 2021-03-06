//
//  ProfileView.swift
//  InsClone
//
//  Created by Sen Lin on 4/8/2021.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    
    @ObservedObject var viewModel: ProfileViewModel
    
    init(user: User) {
        self.user = user
        self.viewModel = ProfileViewModel(user: self.user)
    }
    
    var body: some View {
        ScrollView{
            ProfileHeaderView(viewModel: viewModel)
            Divider()
                .padding(.bottom)
            PostGridView(config: .profile(user.id ?? ""))
        }

    }
}

//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView()
//    }
//}
