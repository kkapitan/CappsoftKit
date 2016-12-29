//
//  TestProviders.swift
//  CappsoftKit
//
//  Created by Krzysztof Kapitan on 28.12.2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import CappsoftKit

struct TestProvider: DataProvidable {
    typealias Element = String
    
    let items: [String]? = ["Test 1", "Test 2", "Test 3", "Test 4", "Test 5"]
    
    func loadItems(completion: @escaping (ItemsFetchingResult<Element>) -> ()) {
        completion(.success(items: items!))
    }
}
