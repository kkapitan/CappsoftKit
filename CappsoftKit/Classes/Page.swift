//
//  Page.swift
//  Pods
//
//  Created by Krzysztof Kapitan on 23.12.2016.
//
//

import Foundation

public struct Page {
    public let index: Int
    public let limit: Int
    
    var next: Page {
        return Page(index: index + 1, limit: limit)
    }
    
    var isFirst: Bool {
        return index == 1
    }
    
    var first: Page {
        return Page(index: 1, limit: limit)
    }
    
    public init(index: Int, limit: Int) {
        self.index = index
        self.limit = limit
    }
}
