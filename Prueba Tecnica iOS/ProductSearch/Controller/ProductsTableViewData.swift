//
//  ProductsTableViewData.swift
//  Prueba Tecnica iOS
//
//  Created by Carlos Corchado on 02/03/23.
//

import Foundation
import UIKit

final class ProductsTableViewData: NSObject, UITableViewDataSource {
    private let tableView: UITableView
    
    private(set) var products: [Products] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    init(tableView: UITableView, products: [Products] = []) {
        self.tableView = tableView
        self.products = products
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductTableViewCell
        
        let product = products[indexPath.row]
        cell.configure(product)
        
        return cell
    }
    
    func set(products: [Products]) {
        self.products = products
    }
}

