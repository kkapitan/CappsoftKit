//
//  CellTypeSpec.swift
//  CappsoftKit
//
//  Created by Krzysztof Kapitan on 24.12.2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Quick
import Nimble
@testable import CappsoftKit

struct TestProvider: DataProvidable {
    typealias Element = String
    
    let items: [String]? = ["Test 1", "Test 2", "Test 3", "Test 4", "Test 5"]
    
    func loadItems(completion: @escaping (ItemsFetchingResult<Element>) -> ()) {
        completion(.success(items: items!))
    }
}

class DataSourceSpec: QuickSpec {
    
    override func spec() {
        describe("DataSource") {
            var dataSource: DataSource<CellTypeCell, TestProvider>!
            var provider: TestProvider!
            
            beforeEach {
                provider = TestProvider()
                dataSource = DataSource<CellTypeCell, TestProvider>(provider: provider)
            }
            
            it("stores the provider") {
                expect(dataSource.provider).toNot(beNil())
            }
            
            it("returns count of provider items") {
                expect(dataSource.count()).to(equal(provider.items?.count))
            }
            
            it("returns provider items as items to present") {
                expect(dataSource.itemsToDisplay()).to(equal(provider.items))
            }
            
            context("when asked for item at index path") {
                it("returns correct item if present") {
                    let index = IndexPath(row: 1, section: 10)
                    let item = dataSource.itemAtIndexPath(index)
                    
                    expect(item).to(equal(provider.items![1]))
                }

                it("returns nil if item is not present") {
                    let index = IndexPath(row: 1000, section: 10)
                    let item = dataSource.itemAtIndexPath(index)
                    
                    expect(item).to(beNil())
                }
            }
        }
    }
}

