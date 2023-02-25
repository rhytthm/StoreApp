//
//  VCExtension.swift
//  Store
//
//  Created by Rhytthm Mahajan on 25/02/23.
//

import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource
{
    // Creating rows in the table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.products?.count ?? 0
    }
    
    // Adding Data to the rows
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell") as! ProductTableViewCell
        let productItem = self.products?[indexPath.row]
        cell.configure(image: productItem?.image, titleText: productItem?.title, priceText: productItem?.price, ratingText: productItem?.rating?.rate)

        return cell
        
    }
    
    // Creating a single section in the table
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Height of the row
        150
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)

        parser.parserProduct(productId: products?[indexPath.row].id) { [self] (_Product) in
            if(_Product != nil){
                self.product = _Product
            
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "showDetail", sender: self)
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as?  DetailProductViewController{
            vc.configure(product: self.product)
        }
    }
    
    
}
