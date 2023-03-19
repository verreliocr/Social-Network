//
//  ListPostModule.swift
//  Social Network
//
//  Created by Verrelio C. Rizky on 19/03/23.
//

import UIKit

class ListPostModule: IModule {
    var router: IRouter
    
    init(appRouter: IRouter) {
        self.router = appRouter
    }
    
    func resolve(using params: [String : Any]) -> UIViewController {
        let interactor = ListPostInteractor()
        let presenter = ListPostPresenter(interactor: interactor)
        let view = ListPostView(presenter: presenter)
        presenter.setView(view)
        return view
    }
}
