//
//  SampleDataFetcher.swift
//  CappsoftKit
//
//  Created by Krzysztof Kapitan on 23.12.2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import CappsoftKit

struct SampleDataFetcher : DataFetchable {
    typealias Element = String
    
    func fetchItems(completion: (ItemsFetchingResult<String>) -> ()) {
        completion(.success(items: ["Test 1", "Test 2", "Test 3"]))
    }
}
