//
//  NibLoadableSpec.swift
//  CappsoftKit
//
//  Created by Krzysztof Kapitan on 24.12.2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Quick
import Nimble
@testable import CappsoftKit

class NibLoadableSpec: QuickSpec {
    
    override func spec() {
        describe("NibLoadable protocol") {
            context("when implemented by Reusable") {
                it("has nib name equal to the reuse identifier") {
                    expect(ReusableNibLoadableCell.nibName).to(equal(ReusableNibLoadableCell.reuseIdentifier))
                }
            }
            
            context("when implemented by View") {
                it("can instantiate the view") {
                    expect(ReusableNibLoadableCell.view).toNot(beNil())
                }
            }
        }
    }
}

