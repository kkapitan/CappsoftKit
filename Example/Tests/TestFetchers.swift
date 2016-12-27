//
//  TestFetchers.swift
//  CappsoftKit
//
//  Created by Krzysztof Kapitan on 27.12.2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import CappsoftKit

struct TestSuccessFetcher : DataFetchable {
    typealias Element = String
    
    let data =  ["Test", "Test", "Test"]
    
    func fetchItems(completion: (ItemsFetchingResult<String>) -> ()) {
        completion(.success(items: data))
    }
}

class TestSuccessPagedFetcher : PagedDataFetchable {
    typealias Page = TestPageDescriptor
    typealias Element = String
    
    var page: Page
    
    let data1 =  ["Test 1", "Test 1", "Test 1"]
    let data2 =  ["Test 2", "Test 2", "Test 2"]
    
    func fetchItems(page: TestPageDescriptor, completion: (ItemsFetchingResult<String>) -> ()) {
        completion(.success(items: page.index == 1 ? data1 : data2))
    }
    
    init() {
        page = Page(index: 10, limit: 100)
    }
}

struct TestErrorFetcher : DataFetchable {
    typealias Element = String
    
    let error = NSError(domain: "com.test.cappsoft-kit", code: 100, userInfo: nil)
    
    func fetchItems(completion: (ItemsFetchingResult<String>) -> ()) {
        completion(.error(error: error))
    }
}

