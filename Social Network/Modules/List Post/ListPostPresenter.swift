//
//  ListPostPresenter.swift
//  Social Network
//
//  Created by Verrelio C. Rizky on 19/03/23.
//

import UIKit

class ListPostPresenter: IListPostPresenter {
    
    weak var view   : IListPostView?
    let interactor  : IListPostInteractor
    let viewModel   : ListPostViewModel
    let wireframe   : IListPostWireframe
    
    init(interactor: IListPostInteractor, viewModel: ListPostViewModel, wireframe: IListPostWireframe) {
        self.interactor = interactor
        self.viewModel  = viewModel
        self.wireframe  = wireframe
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
        self.viewModel.selectedUser = getUser().filter({ $0.id == id }).first
    }
    
    func getSelectedUser() -> String {
        if let user = self.viewModel.selectedUser {
            return user.username
        }
        self.viewModel.selectedUser = getUser()[0]
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
        if let user = self.viewModel.selectedUser {
            self.wireframe.navigateToAddPost(with: user)
        }
    }
}
