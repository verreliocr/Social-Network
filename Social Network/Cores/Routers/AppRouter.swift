//
//  AppRouter.swift
//  Social Network
//
//  Created by Verrelio C. Rizky on 19/03/23.
//

import UIKit

class AppRouter: IRouter {
    private var navigationController: UINavigationController!
    
    func setNavigationController(_ nav: UINavigationController) {
        navigationController = nav
    }
    
    func setRoot(to module: FeatureModule, window: UIWindow? = nil, using params: [String : Any] = [:]) {
        let module = module.create(using: self)
        let viewController: UIViewController = module.resolve(using: params)
        let navigationController = UINavigationController(rootViewController: viewController)
        self.navigationController = navigationController
        module.router.setNavigationController(navigationController)
        window?.rootViewController = navigationController
    }
}
