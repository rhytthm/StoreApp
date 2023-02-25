//
//  ViewController.swift
//  Store
//
//  Created by Rhytthm Mahajan on 25/02/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var products: [Product]? = nil
    let parser: Parser = Parser()
    var product: Product? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        parser.parserProductList { [self] (_ProductList) in
            if(_ProductList != nil){
                self.products = _ProductList
                print("product 1 = \(products?[0].description ?? "wooo")")
                // now Reloading table on the main thread
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }

}

