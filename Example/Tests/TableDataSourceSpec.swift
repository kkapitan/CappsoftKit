//
//  TableDataSourceSpec.swift
//  CappsoftKit
//
//  Created by Krzysztof Kapitan on 28.12.2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Nimble
import Quick
@testable import CappsoftKit

let TestCellDescriptor = CellDescriptor<String>(cellClass: CellTypeCell.self)
let SecondTestCellDescriptor = CellDescriptor<String>(cellClass: SecondCellTypeCell.self)

class TableDataSourceSpec: QuickSpec {
    
    override func spec() {
        describe("TableDataSource") {

            context("when initialized using convienience init") {
                var dataSource: TableDataSource<TestProvider>!
                var provider: TestProvider!
                
                beforeEach {
                    provider = TestProvider()
                    dataSource = TableDataSource<TestProvider>(provider: provider, descriptor: TestCellDescriptor)
                }
                
                itBehavesLike("Generic data source"){ ["data_source": dataSource, "provider": provider]}
                
                it("conforms to table view data source protocol") {
                    expect(dataSource.conforms(to: UITableViewDataSource.self)).to(beTrue())
                }
                
                it("returns provider items count as number of items in row"){
                    let count = dataSource.tableView(UITableView(), numberOfRowsInSection: 0)
                    
                    expect(count).to(equal(provider.items?.count))
                }
                
                it("returns cell for index path that matches cell descriptor class"){
                    let tableView = UITableView()
                    tableView.register(TestCellDescriptor.cellClass, forCellReuseIdentifier: TestCellDescriptor.reuseIdentifier)
                    
                    let cell = dataSource.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
                    
                    expect(cell as? CellTypeCell).toNot(beNil())
                }
            }
            
            context("when initialized using designated init") {
                var dataSource: TableDataSource<TestProvider>!
                var provider: TestProvider!
                
                beforeEach {
                    provider = TestProvider()
                    dataSource = TableDataSource<TestProvider>(provider: provider) { model, indexPath in
                        return indexPath.row % 2 == 0 ? TestCellDescriptor : SecondTestCellDescriptor
                    }
                }
                
                itBehavesLike("Generic data source"){ ["data_source": dataSource, "provider": provider]}
                
                it("returns provider items count as number of items in row"){
                    let count = dataSource.tableView(UITableView(), numberOfRowsInSection: 0)
                    
                    expect(count).to(equal(provider.items?.count))
                }
                
                it("returns cell for index path that matches cell descriptor class"){
                    
                    let tableView = UITableView()
                    
                    tableView.register(TestCellDescriptor.cellClass, forCellReuseIdentifier: TestCellDescriptor.reuseIdentifier)
                    tableView.register(SecondTestCellDescriptor.cellClass, forCellReuseIdentifier: SecondTestCellDescriptor.reuseIdentifier)
                    
                    let cell = dataSource.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
                    expect(cell as? CellTypeCell).toNot(beNil())
                    
                    let cell2 = dataSource.tableView(tableView, cellForRowAt: IndexPath(row: 1, section: 0))
                    
                    expect(cell2 as? SecondCellTypeCell).toNot(beNil())
                }
            }
        }
    }
}

