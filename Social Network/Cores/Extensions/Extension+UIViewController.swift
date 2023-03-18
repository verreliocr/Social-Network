//
//  Extension+UIViewController.swift
//  Social Network
//
//  Created by Verrelio C. Rizky on 18/03/23.
//

import UIKit

extension UIViewController {
    static func topViewController(controller: UIViewController? = UIApplication.shared.currentWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
    
    func showMessage(_ message: String, title: String) {
        showMessage(message, title: title, completion: nil)
    }
    
    func showMessage(_ message: String, title: String, completion: (() -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            completion?()
        }
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func showMessageWithMultipleAction(_ message: String, title: String, actions: [(String, UIAlertAction.Style, (() -> Void)?)]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for action in actions {
            let alertAction = UIAlertAction(title: action.0, style: action.1) { _ in
                action.2?()
            }
            alert.addAction(alertAction)
        }
        
        present(alert, animated: true, completion: nil)
    }
    
    func popView() {
        navigationController?.popViewController(animated: true)
    }
    
}
