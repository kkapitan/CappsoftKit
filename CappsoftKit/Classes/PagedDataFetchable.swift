//
//  PagedDataFetchable.swift
//  Pods
//
//  Created by Krzysztof Kapitan on 23.12.2016.
//
//

import Foundation

public protocol PagedDataFetchable : class, DataFetchable {
    associatedtype Page: PageDescriptor
    
    var page: Page { get set }
    
    func fetchItems(page: Page, completion: ItemsFetchingCompletion<Element>)    
}

public extension PagedDataFetchable {
    
    func fetchItems(completion: ItemsFetchingCompletion<Element>) {
        fetchItems(page: page, completion: completion)
    }
    
    func fetchNext(completion: ItemsFetchingCompletion<Element>) {
        page = Page.next(page)
        
        fetchItems(page: page, completion: completion)
    }
    
    func fetchFirst(completion: ItemsFetchingCompletion<Element>) {
        page = Page.first(page)
        
        fetchItems(page: page, completion: completion)
    }
}

