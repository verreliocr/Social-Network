//
//  Extension+UITableView.swift
//  Social Network
//
//  Created by Verrelio C. Rizky on 19/03/23.
//

import UIKit

extension UITableView {
    func register(_ cells: [UITableViewCell.Type]) {
        for cell in cells {
            register(cell.defaultNib, forCellReuseIdentifier: cell.defaultIdentifier)
        }
    }
    
    func dequeueReusableCell<T: UITableViewCell>() -> T? {
        return dequeueReusableCell(withIdentifier: T.defaultIdentifier) as? T
    }
}
