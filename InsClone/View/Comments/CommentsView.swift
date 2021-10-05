//
//  CommentsView.swift
//  InsClone
//
//  Created by 林森 on 5/10/2021.
//

import SwiftUI

struct CommentsView: View {
    var body: some View {
        VStack{
            ScrollView{
                LazyVStack(alignment: .leading, spacing: 12){
                    ForEach(0..<10){_ in
                        CommentCell()
                            .padding(.leading)
                    }
                }
            }
            .padding(.top)
        }
    
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView()
    }
}
