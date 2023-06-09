//
//  Post.swift
//  Social Network
//
//  Created by Verrelio C. Rizky on 18/03/23.
//

import UIKit

struct Post: Codable {
    var id      : Int
    var user    : User
    var text    : String
}
