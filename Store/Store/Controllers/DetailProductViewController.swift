//
//  DetailProductViewController.swift
//  Store
//
//  Created by Rhytthm Mahajan on 25/02/23.
//

import UIKit

class DetailProductViewController: UIViewController {

    @IBOutlet weak var productImage: LazyImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    var productModel: Product? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let productImageString = productModel?.image, let productImageUrl = URL(string:(productImageString)) {
            productImage.loadImage(fromURL: productImageUrl, placeHolderImage: "Loading")
        }

        if let text = productModel?.title{
            titleLabel.text = text
            self.titleLabel.isHidden = false
        }else{
            self.titleLabel.isHidden = true
        }
        
        if let text = productModel?.description{
            descriptionLabel.text = text
            self.descriptionLabel.isHidden = false
        }else{
            self.descriptionLabel.isHidden = true
        }
        
        if let text = productModel?.price{
            priceLabel.text = "₹ \(text)"
            self.priceLabel.isHidden = false
        }else{
            self.priceLabel.isHidden = true
        }
        
        if let text = productModel?.category{
            categoryLabel.text = text.rawValue
            self.categoryLabel.isHidden = false
        }else{
            self.categoryLabel.isHidden = true
        }
        
        if let text = productModel?.rating?.rate{
            ratingLabel.text = "\(text) ⭐"
            self.ratingLabel.isHidden = false
        }else{
            self.ratingLabel.isHidden = true
        }
        
    }
    
    public func configure(product:Product?){
        self.productModel = product
    }
}
