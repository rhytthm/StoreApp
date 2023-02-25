//
//  ProductTableViewCell.swift
//  Store
//
//  Created by Rhytthm Mahajan on 25/02/23.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productImage: LazyImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(image:String?, titleText:String?, priceText:Double?, ratingText:Double?){
        // Here there can be a case of eager Loading
        let productImageUrl = URL(string: (image)!)!
        productImage.loadImage(fromURL: productImageUrl, placeHolderImage: "Loading")
        
        if let titleText = titleText{
            titleLabel.text = titleText
            self.titleLabel.isHidden = false
        }else{
            self.titleLabel.isHidden = true
        }
        
        if let priceText = priceText{
            priceLabel.text = "₹ \(priceText)"
            self.priceLabel.isHidden = false
        }else{
            self.priceLabel.isHidden = true
        }
        
        if let ratingText = ratingText{
            ratingLabel.text = "\(ratingText) ⭐"
            self.ratingLabel.isHidden = false
        }else{
            self.ratingLabel.isHidden = true
        }
        
    }

}
