//
//  LazyImageView.swift
//  Store
//
//  Created by Rhytthm Mahajan on 25/02/23.
//

import UIKit

//  to solve eager loading case in  UITableView, cellForRowAt method lazy loading has been used
public class LazyImageView: UIImageView
{

    private let imageCache = NSCache<AnyObject, UIImage>()

    public func loadImage(fromURL imageURL: URL, placeHolderImage: String)
    {
        self.image = UIImage(named: placeHolderImage)

        DispatchQueue.global().async {
            [weak self] in

            if let imageData = try? Data(contentsOf: imageURL)
            {
                debugPrint("image has been downloaded from server...")
                if let image = UIImage(data: imageData)
                {
                    DispatchQueue.main.async {
                        guard let self = self else{return}
                        self.imageCache.setObject(image, forKey: imageURL as AnyObject)
                        self.image = image
                    }
                }
            }
        }
    }
}
