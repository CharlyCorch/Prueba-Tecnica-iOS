//
//  ProductTableView.swift
//  Prueba Tecnica iOS
//
//  Created by Carlos Corchado on 02/03/23.
//

import Foundation
import UIKit

class ProductTableView: UIView {
    let productTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: "ProductTableViewCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.addSubview(productTableView)
    }
    
    private func setupConstraints() {
        productTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        productTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        productTableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        productTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}
