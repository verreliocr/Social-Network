//
//  DiskHelper.swift
//  Social Network
//
//  Created by Verrelio C. Rizky on 19/03/23.
//

import Foundation
import Disk

struct DiskHelper {
    static func savePost(_ data: [Post]) {
        try? Disk.append(data, to: "post.json", in: .documents)
    }
    
    static func retrievePostData() -> [Post] {
        if let post = try? Disk.retrieve("post.json", from: .documents, as: [Post].self) {
            return post
        }
        return []
    }
    
    static func saveImage(_ data: UIImage, id: String) {
        try? Disk.save(data, to: .documents, as: "\(id).png")
    }
    
    static func retrievedImage(id: String) -> UIImage? {
        if let images = try? Disk.retrieve("\(id).png", from: .documents, as: UIImage.self) {
            return images
        }
        return nil
    }
}