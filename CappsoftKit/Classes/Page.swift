//
//  Page.swift
//  Pods
//
//  Created by Krzysztof Kapitan on 23.12.2016.
//
//

import Foundation

public protocol PageDescriptor: Equatable {
    var index: Int { get }
    var limit: Int { get }
    
    static var next: (Self) -> Self { get }
    static var first: (Self) -> Self { get }
}

public struct Page: PageDescriptor {
    public let index: Int
    public let limit: Int
    
    public static var next = { (page: Page) in
        return Page(index: page.index + 1, limit: page.limit)
    }
    
    public static var first = { (page: Page) in
        return Page(index: 1, limit: page.limit)
    }

    public init(index: Int, limit: Int) {
        self.index = index
        self.limit = limit
    }
}

extension Page: Equatable {
    public static func == (lhs: Page, rhs: Page) -> Bool {
        return lhs.index == rhs.index;
    }
}
