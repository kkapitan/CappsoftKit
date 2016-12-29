//
//  DataSourceSharedExample.swift
//  CappsoftKit
//
//  Created by Krzysztof Kapitan on 29.12.2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Nimble
import Quick
@testable import CappsoftKit

class DataSourceSharedExamplesConfiguration: QuickConfiguration {
    override class func configure(_ configuration: Configuration) {
        sharedExamples("Generic data source") { (sharedExampleContext: @escaping SharedExampleContext) in
            var provider: TestProvider!
            var dataSource: DataSource<TestProvider>!
            
            beforeEach {
                let context = sharedExampleContext()
                provider = context["provider"] as! TestProvider
                dataSource = context["data_source"] as! DataSource<TestProvider>
            }
            
            it("stores the provider") {
                expect(dataSource.provider).toNot(beNil())
            }
            
            it("returns count of provider items") {
                expect(dataSource.count()).to(equal(dataSource.itemsToDisplay()?.count))
            }
            
            it("returns provider items as items to present") {
                expect(dataSource.itemsToDisplay()).to(equal(provider.items))
            }
            
            context("when asked for item at index path") {
                it("returns correct item if present") {
                    let index = IndexPath(row: 1, section: 10)
                    let item = dataSource.itemAtIndexPath(index)
                    
                    expect(item).to(equal(dataSource.itemsToDisplay()![1]))
                }
                
                it("returns nil if item is not present") {
                    let index = IndexPath(row: 10000, section: 10)
                    let item = dataSource.itemAtIndexPath(index)
                    
                    expect(item).to(beNil())
                }
            }
        }
    }
}
