//
//  AddPostInteractor.swift
//  Social Network
//
//  Created by Verrelio C. Rizky on 19/03/23.
//

import UIKit

class AddPostInteractor: IAddPostInteractor {
    func savePost(_ post: Post, with image: UIImage?) {
        DiskHelper.savePost(post)
        if let img = image {
            DiskHelper.saveImage(img, with: post.id)
        }
    }
}
