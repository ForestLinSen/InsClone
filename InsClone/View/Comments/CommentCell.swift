//
//  CommentCell.swift
//  InsClone
//
//  Created by 林森 on 5/10/2021.
//

import SwiftUI

struct CommentCell: View {
    var body: some View {
        
        HStack(){
            Image("ironMan")
                .resizable()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
            
            Text("batman")
                .font(.system(size: 14, weight: .semibold)) +
            Text(" Some comment here")
                .font(.system(size: 14))
        }
        
        
    }
}

struct CommentCell_Previews: PreviewProvider {
    static var previews: some View {
        CommentCell()
    }
}
