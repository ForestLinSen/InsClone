//
//  NotificationView.swift
//  InsClone
//
//  Created by SenLin on 3/8/2021.
//

import SwiftUI

struct NotificationView: View {
    
    
    
    var body: some View {
        ScrollView {
            LazyVStack (spacing: 20){
                ForEach(0..<10){ _ in
                    NotificationViewCell()
                }
            }
            .padding(.top, 20)
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
