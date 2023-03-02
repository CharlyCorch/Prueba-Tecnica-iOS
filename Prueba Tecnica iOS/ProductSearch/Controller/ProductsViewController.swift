//
//  ProductsViewController.swift
//  Prueba Tecnica iOS
//
//  Created by Carlos Corchado on 02/03/23.
//

import UIKit

class ProductsViewController: UIViewController {
    var mainView: ProductTableView { self.view as! ProductTableView }
    private var tableViewData: ProductsTableViewData?
    private var tableViewDelagate: ProductsTableViewDelegate?
    private var searchController: SearchBarController?
    
    override func loadView() {
        self.view = ProductTableView()
        
        tableViewData = ProductsTableViewData(tableView: mainView.productTableView)
        tableViewDelagate = ProductsTableViewDelegate()
        mainView.productTableView.dataSource = tableViewData
        mainView.productTableView.delegate = tableViewDelagate
        
        searchController = SearchBarController()
        searchController?.searchBar.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Sistema de Busquedas Liverpool"
        self.navigationItem.searchController = searchController
        self.definesPresentationContext = true
    }
    
    private func getProductByTerm(_ term: String) {
        APIClient.share.getListProducts(searchTerm: term, pageNumber: 0) { [weak self] (result: Result<[Products], Error>) in
            switch result {
            case .success(let products): self?.tableViewData?.set(products: products)
            case .failure(let failure): print(failure.localizedDescription)
            }
        }
    }
    
}

extension ProductsViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let term = searchBar.text, !term.isEmpty {
            getProductByTerm(term)
        }
    }
}

