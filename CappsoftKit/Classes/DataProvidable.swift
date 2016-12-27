//
//  DataProvidable.swift
//  Pods
//
//  Created by Krzysztof Kapitan on 23.12.2016.
//
//

import Foundation

public protocol DataProvidable {
    associatedtype Element
    
    var items: [Element]? { get }
    func loadItems(completion: @escaping (ItemsFetchingResult<Element>) -> ())
}
