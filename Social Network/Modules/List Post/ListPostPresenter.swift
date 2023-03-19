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
    
    init(interactor: IListPostInteractor) {
        self.interactor = interactor
    }
    
    func setView(_ view: IListPostView) {
        self.view = view
    }
    
    func viewWillAppearing() {
        self.view?.reloadData()
    }
    
    func getNumberOfUsers() -> Int {
        return self.interactor.getListUsers().count
    }
    
    func getUser(at index: Int) -> String {
        return self.interactor.getListUsers()[index].name
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
}
