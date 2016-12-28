//
//  CellDescriptorSpec.swift
//  CappsoftKit
//
//  Created by Krzysztof Kapitan on 28.12.2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Quick
import Nimble
@testable import CappsoftKit

class CellDescriptorSpec: QuickSpec {
    
    override func spec() {
        describe("Cell descriptor") {
            
            context("when initialized using convienience init") {
                var descriptor: CellDescriptor<String>!
                beforeEach {
                    descriptor = CellDescriptor<String>(cellClass: CellTypeCell.self)
                }
                
                it("stores the cell class") {
                    expect(descriptor.cellClass as? CellTypeCell.Type).toNot(beNil())
                }
                
                it("stores the reuse identifier") {
                    expect(descriptor.reuseIdentifier).to(equal(CellTypeCell.reuseIdentifier))
                }
                
                it("has default configuration block") {
                    expect(descriptor.configureCell).toNot(beNil())
                }

            }
            
            context("when initialized using standard init") {
                var descriptor: CellDescriptor<String>!
                beforeEach {
                    descriptor = CellDescriptor<String>(cellClass: CellTypeCell.self) { cell, indexPath, model in }
                }
                
                it("stores the cell class") {
                    expect(descriptor.cellClass as? CellTypeCell.Type).toNot(beNil())
                }
                
                it("stores the reuse identifier") {
                    expect(descriptor.reuseIdentifier).to(equal(CellTypeCell.reuseIdentifier))
                }
                
                it("stores configuration block") {
                    expect(descriptor.configureCell).toNot(beNil())
                }
            }

        }
    }
}

