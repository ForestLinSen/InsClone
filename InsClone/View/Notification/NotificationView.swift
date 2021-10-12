//
//  NotificationView.swift
//  InsClone
//
//  Created by Sen Lin on 3/8/2021.
//

import SwiftUI

struct NotificationView: View {
    
    @ObservedObject var viewModel = NotificationViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack (spacing: 20){
                ForEach(viewModel.notifications){ notification in
                    NotificationViewCell(notification: notification)
                }
            }
            .padding(.top, 20)
        }
    }
}

//struct NotificationView_Previews: PreviewProvider {
//    static var previews: some View {
//        NotificationView()
//    }
//}
