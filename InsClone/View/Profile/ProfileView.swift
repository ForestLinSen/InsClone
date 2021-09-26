//
//  ProfileView.swift
//  InsClone
//
//  Created by SenLin on 4/8/2021.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    
    var body: some View {
        ScrollView{
            ProfileHeaderView(user: user)
            Divider()
                .padding(.bottom)
            PostGridView()
        }

    }
}

//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView()
//    }
//}
