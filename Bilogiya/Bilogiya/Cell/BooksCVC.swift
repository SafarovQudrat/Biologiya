//
//  BooksCVC.swift
//  Bilogiya
//
//  Created by MacBook Pro on 25/02/24.
//

import UIKit

class BooksCVC: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var textLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMinXMaxYCorner]
        imageView.layer.cornerRadius = 8
    }

}
