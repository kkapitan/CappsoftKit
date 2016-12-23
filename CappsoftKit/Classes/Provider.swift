//
//  Provider.swift
//  Pods
//
//  Created by Krzysztof Kapitan on 23.12.2016.
//
//

import Foundation

public class Provider<Fetcher : DataFetchable> : DataProvidable {
    public typealias Element = Fetcher.Element
    
    private(set) public var items: [Element]?
    
    let fetcher: Fetcher
    
    public init(fetcher: Fetcher) {
        self.items = []
        self.fetcher = fetcher
    }
    
    public func loadItems(completion: (ItemsFetchingResult<Element>) -> ()) {
        fetcher.fetchItems { (result) in
            if case .success(let items) = result {
                self.items = items
            }
            
            completion(result)
        }
    }
}

public extension Provider where Fetcher: PagedDataFetchable {
    func loadMore(completion: ItemsFetchingCompletion<Element>) {
        fetcher.page = fetcher.page.next
        
        loadItems(completion: completion)
    }
    
    func reloadItems(completion: ItemsFetchingCompletion<Element>) {
        fetcher.page = fetcher.page.first
        
        loadItems(completion: completion)
    }
}


