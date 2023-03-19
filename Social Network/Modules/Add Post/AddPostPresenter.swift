//
//  AddPostPresenter.swift
//  Social Network
//
//  Created by Verrelio C. Rizky on 19/03/23.
//

import UIKit

class AddPostPresenter: IAddPostPresenter {
    
    weak var view   : IAddPostView?
    let interactor  : IAddPostInteractor
    let viewModel   : AddPostViewModel
    
    init(interactor: IAddPostInteractor, viewModel: AddPostViewModel) {
        self.interactor = interactor
        self.viewModel  = viewModel
    }
    
    func setView(_ view: IAddPostView) {
        self.view = view
    }
    
    func setText(_ v: String) {
        viewModel.text = v
    }
    
    func setImage(_ v: UIImage) {
        viewModel.image = v
    }
    
    private func didAddPost() {
        let getLastPost = DiskHelper.retrievePostData()
        
        let post = Post(id  : getLastPost.count + 1,
                        user: viewModel.selectedUser,
                        text: viewModel.text)
        
        self.interactor.savePost(post,
                                 with: viewModel.image)
        
        self.view?.back()
    }
    
    func didTapAddPostButton() {
        if viewModel.text == "" && viewModel.image == nil {
            self.view?.showMessage("Post can't be empty!", title: "Alert", completion: nil)
        }else{
            didAddPost()
        }
    }
}
