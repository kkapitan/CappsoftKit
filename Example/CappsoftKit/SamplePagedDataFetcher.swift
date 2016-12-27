//
//  SamplePagedDataFetcher.swift
//  CappsoftKit
//
//  Created by Krzysztof Kapitan on 23.12.2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import CappsoftKit

class SamplePagedDataFetcher: PagedDataFetchable {
    var page: Page
    
    typealias Element = String
    
    required init(page: Page) {
        self.page = page
    }
    
    func fetchItems(page: Page, completion: (ItemsFetchingResult<String>) -> ()) {
        completion(.success(items: (1..<10).map { "Test \($0) p:\(page.index)" }))
    }
}

