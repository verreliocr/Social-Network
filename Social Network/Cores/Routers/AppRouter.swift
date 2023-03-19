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
}
