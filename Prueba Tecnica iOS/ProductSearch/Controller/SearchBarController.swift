//
//  SearchBarController.swift
//  Prueba Tecnica iOS
//
//  Created by Carlos Corchado on 02/03/23.
//

import Foundation
import UIKit

class SearchBarController: UISearchController {
    
    override func viewDidLoad() {
        self.obscuresBackgroundDuringPresentation = false
        self.searchBar.placeholder = "¿Que deseas buscar?"
        self.searchBar.autocapitalizationType = .none
        self.searchBar.tintColor = .black
        self.searchBar.searchTextField.leftView?.tintColor = .gray
    }
}
