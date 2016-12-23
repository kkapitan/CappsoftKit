//
//  DataFetchable.swift
//  Pods
//
//  Created by Krzysztof Kapitan on 23.12.2016.
//
//

import Foundation

public enum ItemsFetchingResult<T> {
    case success(items: [T])
    case error(error: Error?)
}

public typealias ItemsFetchingCompletion<T> = (_ result: ItemsFetchingResult<T>) -> ()


public protocol DataFetchable {
    associatedtype Element
    
    func fetchItems(completion: ItemsFetchingCompletion<Element>)
}

