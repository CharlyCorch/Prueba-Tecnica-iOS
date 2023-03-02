//
//  Product.swift
//  Prueba Tecnica iOS
//
//  Created by Carlos Corchado on 02/03/23.
//

import Foundation

struct Products: Decodable{
    let productName: String
    let listPrice: Double
    let discountPrice: Double
    let displayImage: String
    let colors:[Colors]
}
