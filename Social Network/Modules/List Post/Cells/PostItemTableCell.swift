//
//  PostItemTableCell.swift
//  Social Network
//
//  Created by Verrelio C. Rizky on 19/03/23.
//

import UIKit

class PostItemTableCell: UITableViewCell {

    @IBOutlet weak var nameLabel    : UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var postLabel    : UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private func setupView() {
        selectionStyle = .none
    }
    
    func bind(name: String, username: String, post: String, image: UIImage) {
        nameLabel.text      = name
        usernameLabel.text  = username
        postLabel.text      = post
        postImageView.image = image
    }
    
}
