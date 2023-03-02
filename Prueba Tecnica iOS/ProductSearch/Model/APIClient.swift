//
//  APIClient.swift
//  Prueba Tecnica iOS
//
//  Created by Carlos Corchado on 02/03/23.
//

import Foundation
import UIKit

final class APIClient {
    static let share = APIClient()
    
    enum ProductsDataTaskError: Error {
        case urlInvalid
    }
    
    private init() { }
    
    func getListProducts(searchTerm: String, pageNumber: Int, completion: @escaping (Result<[Products], Error>) -> Void) {
        let urlStr = "https://shoppapp.liverpool.com.mx/appclienteservices/services/v3/plp?search-string=\(searchTerm)&page-number=\(pageNumber)"
        
        guard let urlQuery = urlStr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: urlQuery) else {
            completion(.failure(ProductsDataTaskError.urlInvalid))
            return
        }
        
        
        let task = URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let data = data,
               let result = try? JSONDecoder().decode(ResultsResp.self, from: data) {
                completion(.success(result.plpResults.records))
            }
        }
        
        task.resume()
    }
}

