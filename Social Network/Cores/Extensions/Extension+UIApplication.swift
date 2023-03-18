//
//  Extension+UIApplication.swift
//  Social Network
//
//  Created by Verrelio C. Rizky on 18/03/23.
//

import UIKit

extension UIApplication {
    var currentWindow: UIWindow? {
        connectedScenes
        .filter({$0.activationState == .foregroundActive})
        .map({$0 as? UIWindowScene})
        .compactMap({$0})
        .first?.windows
        .filter({$0.isKeyWindow}).first
    }
}
