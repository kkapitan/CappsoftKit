//
//  SamplePagedDataFetcher.swift
//  CappsoftKit
//
//  Created by Krzysztof Kapitan on 23.12.2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import CappsoftKit

class SamplePagedDataFetcher: PagedDataFetchable {
    var fetched: [String]
    var page: Page
    
    typealias Element = String
    
    init(limit: Int) {
        self.fetched = []
        self.page = Page(index: 1, limit: limit)
    }
    
    func fetchItems(page: Page, completion: (ItemsFetchingResult<String>) -> ()) {
        completion(.success(items: (1..<10).map { "Test \($0) p:\(page.index)" }))
    }
}

