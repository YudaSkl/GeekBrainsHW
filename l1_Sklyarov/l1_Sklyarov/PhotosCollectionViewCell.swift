//
//  PhotosCollectionViewCell.swift
//  l1_Sklyarov
//
//  Created by Valeriy Sklyarov on 15.04.2021.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(img: UIImage?){
        if img == nil {self.img.image = UIImage(named: "noimg")}
        self.img.image = img
    }
}
