//
//  ListPostWireframe.swift
//  Social Network
//
//  Created by Verrelio C. Rizky on 20/03/23.
//

import UIKit

class ListPostWireframe: IListPostWireframe {
    let appRouter: IRouter
    
    init(appRouter: IRouter) {
        self.appRouter = appRouter
    }
    
    func navigateToAddPost(with user: User) {
        self.appRouter.push(module: .addPost, using: ["user": user])
    }
}
