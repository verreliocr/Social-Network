//
//  ListPostProtocols.swift
//  Social Network
//
//  Created by Verrelio C. Rizky on 19/03/23.
//

import UIKit

protocol IListPostView: AnyObject {
    func reloadData()
}

protocol IListPostInteractor {
    func getListUsers() -> [User]
    func getListPosts() -> [Post]
}

protocol IListPostPresenter {
    func setView(_ view: IListPostView)
    func viewWillAppearing()
    
    func getNumberOfUsers() -> Int
    func getUser(at index: Int) -> String
    
    func getNumberOfPosts() -> Int
    func getName(at index: Int) -> String
    func getUsername(at index: Int) -> String
    func getText(at index: Int) -> String
    func getImage(at index: Int) -> UIImage?
}
