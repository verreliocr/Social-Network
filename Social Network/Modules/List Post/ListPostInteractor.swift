//
//  ListPostInteractor.swift
//  Social Network
//
//  Created by Verrelio C. Rizky on 19/03/23.
//

import Foundation

class ListPostInteractor: IListPostInteractor {
    func getListUsers() -> [User] {
        let john = User(id: 1, name: "John Appleseed", username: "@john")
        let kate = User(id: 2, name: "Kate Bell", username: "@kate")
        let anna = User(id: 3, name: "Anna Haro", username: "@anna")
        
        return [john, kate, anna]
    }
    
    func getListPosts() -> [Post] {
        return DiskHelper.retrievePostData().sorted(by: { $0.id > $1.id })
    }
}
