//
//  AddPostPorotocols.swift
//  Social Network
//
//  Created by Verrelio C. Rizky on 19/03/23.
//

import UIKit

protocol IAddPostView: AnyObject {
    func back()
    func showMessage(_ message: String, title: String, completion: (() -> Void)?)
}

protocol IAddPostInteractor {
    func savePost(_ post: Post, with image: UIImage?)
}

protocol IAddPostPresenter {
    func setView(_ view: IAddPostView)
    
    func setText(_ v: String)
    func setImage(_ v: UIImage)
    
    func didTapAddPostButton()
}
