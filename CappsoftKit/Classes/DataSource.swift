//
//  DataSource.swift
//  Pods
//
//  Created by Krzysztof Kapitan on 23.12.2016.
//
//

import Foundation

internal class DataSource<Provider: DataProvidable> : NSObject {
    typealias Element = Provider.Element
    
    public let provider: Provider
    
    func itemsToDisplay() -> [Element]? {
        return provider.items
    }
    
    func count() -> Int {
        return itemsToDisplay()?.count ?? 0
    }
    
    public func itemAtIndexPath(_ indexPath: IndexPath) -> Element? {
        guard let items = itemsToDisplay(), items.count > indexPath.row else { return nil }
        
        return items[indexPath.row]
    }
    
    public init(provider: Provider) {
        self.provider = provider
        super.init()
    }
}
