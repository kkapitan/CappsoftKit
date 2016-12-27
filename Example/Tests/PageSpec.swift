//
//  PageSpecs.swift
//  CappsoftKit
//
//  Created by Krzysztof Kapitan on 24.12.2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Quick
import Nimble
@testable import CappsoftKit

class PageSpecs: QuickSpec {
    override func spec() {
        var page: Page!
        
        describe("Page") {
            
            beforeEach {
                page = Page(index: 2, limit: 10)
            }
            
            it("stores index number") {
                expect(page.index) == 2
            }
            
            it("stores limit of items") {
                expect(page.limit) == 10
            }
            
            context("first page") {
                var firstPage: Page!
                
                beforeEach {
                    firstPage = Page.first(page)
                }
                
                it("has the same limit") {
                    expect(firstPage.limit) == page.limit
                }
            }
            
            context("its neighbour") {
                var nextPage: Page!
                
                beforeEach {
                    nextPage = Page.next(page)
                }
                
                it("has the same limit") {
                    expect(nextPage.limit) == page.limit
                }
                
                it("has next index") {
                    expect(nextPage.index) == page.index + 1
                }
            }
            
            context("when compared to other page") {
                it ("is equal when indexes are the same") {
                    let anotherPage = Page(index: 2, limit: 25)
                    expect(page == anotherPage).to(beTrue())
                }
                
                it ("is not equal when indexes are different") {
                    let anotherPage = Page(index: 1, limit: 10)
                    expect(page == anotherPage).to(beFalse())
                }
            }
        }
    }
}
