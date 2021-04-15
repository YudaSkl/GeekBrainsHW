//
//  FriendsTableViewCell.swift
//  l1_Sklyarov
//
//  Created by Valeriy Sklyarov on 15.04.2021.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(title: String?, img: UIImage?){
        if let title = title{
        self.title.text = title
        }
        else{
            self.title.text = "no name"
        }
        if let img = img{
        self.img.image = img
        }
        else{
            self.img.image = UIImage(named: "noimg")
        }
    }
}
