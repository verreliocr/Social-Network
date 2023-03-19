//
//  ListPostInteractor.swift
//  Social Network
//
//  Created by Verrelio C. Rizky on 19/03/23.
//

import Foundation

class ListPostInteractor: IListPostInteractor {
    func getListUsers() -> [User] {
        let john = User(id: 1, name: "John Appleseed", username: "@john.apple")
        let kate = User(id: 2, name: "Kate Bell", username: "@kate.bell")
        let anna = User(id: 3, name: "Anna Haro", username: "@halo.anna")
        
        return [john, kate, anna]
    }
    
    func getListPosts() -> [Post] {
        return DiskHelper.retrievePostData()
    }
}
