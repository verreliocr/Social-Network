//
//  Extension+UITableViewCell.swift
//  Social Network
//
//  Created by Verrelio C. Rizky on 19/03/23.
//

import UIKit

extension UITableViewCell {
    static var defaultIdentifier: String {
        return String(describing: self)
    }
    
    static var defaultNib: UINib {
        return UINib(nibName: defaultIdentifier, bundle: Bundle(for: self))
    }
}
