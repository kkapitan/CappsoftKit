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

class DataSourceSpec: QuickSpec {
    
    override func spec() {
        describe("DataSource") {
            var dataSource: DataSource<TestProvider>!
            var provider: TestProvider!
            
            beforeEach {
                provider = TestProvider()
                dataSource = DataSource<TestProvider>(provider: provider)
            }
            
            itBehavesLike("Generic data source"){ ["data_source": dataSource, "provider": provider]}
        }
    }
}

