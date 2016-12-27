//
//  TableViewExtensionsSpec.swift
//  CappsoftKit
//
//  Created by Krzysztof Kapitan on 24.12.2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Quick
import Nimble
@testable import CappsoftKit

class TableViewExtensionsSpec: QuickSpec {

    override func spec() {
        var tableView: UITableView!
        
        describe("Table View") {
            
            context("when cell conforms to Reusable") {
                
                beforeEach {
                    tableView = UITableView()
                    tableView.register(cell: ReusableCell.self)
                }
                
                it("can register cell") {
                    let cell = tableView.dequeueReusableCell(withIdentifier: ReusableCell.reuseIdentifier)
                    expect(cell).to(beAKindOf(ReusableCell.self))
                }
                
                it("can dequeue cell") {
                    let cell = tableView.dequeueCell() as ReusableCell
                    expect(cell).to(beAKindOf(ReusableCell.self))
                }
            }
            
            context("when cell conforms to Reusable and Nibloadable") {
                
                beforeEach {
                    tableView = UITableView()
                    tableView.register(cell: ReusableNibLoadableCell.self)
                }
                
                
                it("can register cell") {
                    let cell = tableView.dequeueReusableCell(withIdentifier: ReusableNibLoadableCell.reuseIdentifier)
                    expect(cell).to(beAKindOf(ReusableNibLoadableCell.self))
                }
                
                it("can dequeue cell") {
                    let cell = tableView.dequeueCell() as ReusableNibLoadableCell
                    expect(cell).to(beAKindOf(ReusableNibLoadableCell.self))
                }
            }
        }
    }
}

