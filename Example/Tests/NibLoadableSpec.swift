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
    class ReusableCell: UITableViewCell, Reusable {}
    
    override func spec() {
        describe("Reusable protocol") {
            context("when implemented by cell") {
                it("has reuse identifier equal to the class name of cell") {
                    expect(ReusableCell.reuseIdentifier).to(equal("ReusableCell"))
                }
            }
        }
    }
}

