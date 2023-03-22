//
//  DiskHelper.swift
//  Social Network
//
//  Created by Verrelio C. Rizky on 19/03/23.
//

import UIKit
import Disk

struct DiskHelper {
    static func savePost(_ data: Post) {
        try? Disk.append(data, to: "post.json", in: .documents)
    }
    
    static func retrievePostData() -> [Post] {
        if let post = try? Disk.retrieve("post.json", from: .documents, as: [Post].self) {
            return post
        }
        return []
    }
    
    static func saveImage(_ data: UIImage, with id: Int) {
        try? Disk.save(data, to: .documents, as: "posts/\(id).png")
    }
    
    static func retrievedImage(id: Int) -> UIImage? {
        if let images = try? Disk.retrieve("posts/\(id).png", from: .documents, as: UIImage.self) {
            return images
        }
        return nil
    }
}
