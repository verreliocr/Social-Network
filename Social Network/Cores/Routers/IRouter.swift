//
//  IRouter.swift
//  Social Network
//
//  Created by Verrelio C. Rizky on 19/03/23.
//

import UIKit

protocol IRouter: AnyObject {
    func setNavigationController(_ nav: UINavigationController)
    func setRoot(to module: FeatureModule, window: UIWindow?, using params: [String: Any])
}
