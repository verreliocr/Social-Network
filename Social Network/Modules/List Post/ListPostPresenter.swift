//
//  ListPostPresenter.swift
//  Social Network
//
//  Created by Verrelio C. Rizky on 19/03/23.
//

import UIKit

class ListPostPresenter: IListPostPresenter {
    
    weak var view: IListPostView?
    let interactor: IListPostInteractor
    
    var selectedUser: User?
    
    init(interactor: IListPostInteractor) {
        self.interactor = interactor
    }
    
    func setView(_ view: IListPostView) {
        self.view = view
    }
    
    func viewWillAppearing() {
        self.view?.reloadData()
    }
    
    func getUser() -> [User] {
        return self.interactor.getListUsers()
    }
    
    func didSelectUser(at id: Int) {
        self.selectedUser = getUser().filter({ $0.id == id }).first
    }
    
    func getSelectedUser() -> String {
        if let user = self.selectedUser {
            return user.username
        }
        return getUser()[0].username
    }
    
    func getNumberOfPosts() -> Int {
        return self.interactor.getListPosts().count
    }
    
    func getName(at index: Int) -> String {
        return self.interactor.getListPosts()[index].user.name
    }
    
    func getUsername(at index: Int) -> String {
        return self.interactor.getListPosts()[index].user.username
    }
    
    func getText(at index: Int) -> String {
        return self.interactor.getListPosts()[index].text
    }
    
    func getImage(at index: Int) -> UIImage? {
        let postId = self.interactor.getListPosts()[index].id
        return DiskHelper.retrievedImage(id: postId)
    }
    
    func didTapAddPost() {
        
    }
}
