//
//  SearchView.swift
//  InsClone
//
//  Created by SenLin on 3/8/2021.
//

import SwiftUI

struct SearchView: View {
    @State var searchText: String = ""
    @State var isSearchMode: Bool = false
    @ObservedObject var viewModel = SearchViewModel()
    
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText, isEditing: $isSearchMode)
                .padding()
    
            VStack{
                if(isSearchMode){
                    UserListView(viewModel: viewModel, searchText: $searchText)
                }else{
                    PostGridView()
                }
            }
 
        }
    }
}

//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView()
//    }
//}
