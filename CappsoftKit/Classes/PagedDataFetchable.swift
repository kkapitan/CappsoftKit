//
//  PagedDataFetchable.swift
//  Pods
//
//  Created by Krzysztof Kapitan on 23.12.2016.
//
//

import Foundation

public protocol PagedDataFetchable : class, DataFetchable {
    var page: Page { get set }
    var fetched: [Element] { get set }
    
    func fetchItems(page: Page, completion: ItemsFetchingCompletion<Element>)
}

public extension PagedDataFetchable {
    func fetchItems(completion: ItemsFetchingCompletion<Element>) {
        fetchItems(page: page) { result in
            guard case .success(let items) = result else {
                completion(result)
                return
            }
            
            page.isFirst
                ? fetched = items
                : fetched.append(contentsOf: items)
            
            completion(.success(items: fetched))
        }
    }
}

