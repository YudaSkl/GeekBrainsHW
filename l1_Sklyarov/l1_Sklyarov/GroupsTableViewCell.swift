//
//  GroupsTableViewCell.swift
//  l1_Sklyarov
//
//  Created by Valeriy Sklyarov on 15.04.2021.
//

import UIKit

class GroupsTableViewCell: UITableViewCell {

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
    
    func configure(title:String?, img: UIImage?){
        if img == nil{
            self.img.image = UIImage(named: "noimg")
        }
        else{
            self.img.image = img
        }
        if title==nil{
            self.title.text = "no text"
        }
        else{
            self.title.text = title
        }
    }
    
}
