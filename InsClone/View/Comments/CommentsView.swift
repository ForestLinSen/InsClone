//
//  CommentsView.swift
//  InsClone
//
//  Created by Sen Lin on 5/10/2021.
//

import SwiftUI

struct CommentsView: View {
    
    @State var text: String
    @ObservedObject var viewModel: CommentViewModel
    
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
            .onTapGesture {
                UIApplication.shared.endEditing()
            }
            
            CustomInputView(inputText: $text, action: viewModel.uploadComment)
        }
    
    }
}

//struct CommentsView_Previews: PreviewProvider {
//    static var previews: some View {
//        CommentsView(text: "")
//    }
//}
