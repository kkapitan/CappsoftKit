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
    
    fileprivate(set) public var items: [Element]?
    
    let fetcher: Fetcher
    
    public init(fetcher: Fetcher) {
        self.items = []
        self.fetcher = fetcher
    }
    
    public func loadItems(completion: @escaping (ItemsFetchingResult<Element>) -> ()) {
        fetcher.fetchItems  { [weak self] result in
            if case .success(let newItems) = result {
                guard let items = self?.items else { return }
                
                self?.items = Array(items.dropLast(newItems.count))
                self?.items?.append(contentsOf: newItems)
            }
            
            completion(result)
        }
    }
}

public extension Provider where Fetcher: PagedDataFetchable {
    func loadMore(completion: @escaping ItemsFetchingCompletion<Element>) {
        fetcher.fetchNext { [weak self] result in
            if case .success(let newItems) = result {
                self?.items?.append(contentsOf: newItems)
            }
            
            completion(result)
        }
    }
    
    func loadFirst(completion: @escaping ItemsFetchingCompletion<Element>) {
        fetcher.fetchFirst { [weak self] result in
            if case .success(let newItems) = result {
                self?.items = newItems
            }
            
            completion(result)
        }
    }
}
