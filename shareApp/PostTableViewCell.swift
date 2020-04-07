//
//  PostTableViewCell.swift
//  shareApp
//
//  Created by Kozasa Mizuki on 2020/04/06.
//  Copyright © 2020 Kozasa Mizuki. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var likeButton: UIImageView!
    @IBOutlet weak var commentButton: UIImageView!
    @IBOutlet weak var shareButton: UIImageView!
    @IBOutlet weak var bookmarkButton: UIImageView!
    @IBOutlet weak var comment_textfield: UILabel!
    @IBOutlet weak var postedAt: UILabel!
    @IBOutlet weak var usernameAt_textField: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
