//
//  FeedView.swift
//  InsClone
//
//  Created by Sen Lin on 3/8/2021.
//

import SwiftUI

struct FeedView: View {
    
    @ObservedObject var viewModel = PostViewModel()
    
    var body: some View {
    
        ScrollView{  
            LazyVStack(spacing: 32) {
                ForEach(viewModel.posts){ post in
                    FeedCell(post: post)
                }
            }
        }
        .padding(.top)
        
        
    }
}

//struct FeedView_Previews: PreviewProvider {
//    static var previews: some View {
//        FeedView()
//    }
//}
