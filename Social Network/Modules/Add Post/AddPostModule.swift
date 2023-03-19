//
//  AddPostModule.swift
//  Social Network
//
//  Created by Verrelio C. Rizky on 20/03/23.
//

import UIKit

class AddPostModule: IModule {
    var router: IRouter
    
    init(appRouter: IRouter) {
        self.router = appRouter
    }
    
    func resolve(using params: [String : Any]) -> UIViewController {
        let interactor  = AddPostInteractor()
        let viewModel   = AddPostViewModel(selectedUser: params["user"] as! User)
        let presenter   = AddPostPresenter(interactor: interactor,
                                           viewModel: viewModel)
        let view        = AddPostView(presenter: presenter)
        presenter.setView(view)
        return view
    }
}
