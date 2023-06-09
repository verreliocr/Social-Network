//
//  FeatureModule.swift
//  Social Network
//
//  Created by Verrelio C. Rizky on 19/03/23.
//

import UIKit

enum FeatureModule {
    case listPost
    case addPost

    func create(using router: IRouter) -> IModule {
        switch self {
        case .listPost:
            return ListPostModule(appRouter: router)
        case .addPost:
            return AddPostModule(appRouter: router)
        }
    }
}
