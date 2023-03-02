//
//  ProductTableVIewCell.swift
//  Prueba Tecnica iOS
//
//  Created by Carlos Corchado on 02/03/23.
//

import Foundation
import UIKit
import SDWebImage

class ProductTableViewCell: UITableViewCell {
    let productImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let productName: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let listPriceProduct: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = UIColor.lightGray.withAlphaComponent(0.8)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let discountPriceProduct: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = UIColor.systemPink.withAlphaComponent(0.8)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let color: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .systemPink
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.black.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var constraintLeading: NSLayoutConstraint?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        self.addSubview(productImage)
        self.addSubview(productName)
        self.addSubview(listPriceProduct)
        self.addSubview(discountPriceProduct)
        self.addSubview(color)
    }
    
    private func setupConstraints() {
        productImage.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        productImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
        productImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        productImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        productName.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 20).isActive = true
        productName.topAnchor.constraint(equalTo: productImage.topAnchor).isActive = true
        productName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12).isActive = true
        
        listPriceProduct.leadingAnchor.constraint(equalTo: productName.leadingAnchor).isActive = true
        listPriceProduct.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 10).isActive = true
        listPriceProduct.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12).isActive = true
        
        discountPriceProduct.leadingAnchor.constraint(equalTo: listPriceProduct.leadingAnchor).isActive = true
        discountPriceProduct.topAnchor.constraint(equalTo: listPriceProduct.bottomAnchor, constant: 10).isActive = true
        discountPriceProduct.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12).isActive = true
        
        constraintLeading = color.leadingAnchor.constraint(equalTo: discountPriceProduct.leadingAnchor)
        constraintLeading?.isActive = true
        color.topAnchor.constraint(equalTo: discountPriceProduct.bottomAnchor, constant: 10).isActive = true
        color.widthAnchor.constraint(equalToConstant: 20).isActive = true
        color.heightAnchor.constraint(equalToConstant: 20).isActive = true
        color.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12).isActive = true
    }
    
    func configure(_ model: Products) {
        if let url = URL(string: model.displayImage) {
            productImage.sd_setImage(with: url)
        }
        productName.text = model.productName
        listPriceProduct.text = "$\(model.listPrice)"
        
        if model.discountPrice != 0.0 {
            discountPriceProduct.text = "$\(model.discountPrice)"
            listPriceProduct.textColor = UIColor.lightGray.withAlphaComponent(0.8)
        } else {
            discountPriceProduct.text = ""
            listPriceProduct.textColor = UIColor.systemPink.withAlphaComponent(0.9)
        }
        
        for _ in model.colors
            .enumerated() {
            self.addSubview(color)
        }
    }
}
