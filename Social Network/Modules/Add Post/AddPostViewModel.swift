//
//  AddPostViewModel.swift
//  Social Network
//
//  Created by Verrelio C. Rizky on 19/03/23.
//

import UIKit

class AddPostViewModel {
    var selectedUser: User
    var text: String = ""
    var image: UIImage?
    
    init(selectedUser: User) {
        self.selectedUser = selectedUser
    }
}
