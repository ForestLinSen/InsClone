//
//  SearchViewModel.swift
//  InsClone
//
//  Created by SenLin on 20/9/2021.
//

import SwiftUI

class SearchViewModel: ObservableObject{
    @Published var users = [User]()
    
    init() {
        fetchUser()
    }
    
    func fetchUser() {
        COLLECTION_USERS.getDocuments { snapShot, _ in
            guard let documents = snapShot?.documents else{return}
            
            // or documents.forEach{try ... append}
            self.users = documents.compactMap({ try? $0.data(as: User.self)})
            
            //print(self.users)
        }
    }
    
    func filteredUsers(_ query: String) -> [User]{
        let lowercaseQuery = query.lowercased()
        
        return users.filter({$0.fullname.lowercased().contains(lowercaseQuery) ||
                                $0.username.contains(lowercaseQuery)})
    }
}
