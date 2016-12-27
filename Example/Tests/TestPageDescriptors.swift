//
//  TestPageDescriptors.swift
//  CappsoftKit
//
//  Created by Krzysztof Kapitan on 27.12.2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import CappsoftKit

struct TestPageDescriptor : PageDescriptor {
    let index: Int
    let limit: Int
    
    init(index: Int, limit: Int) {
        self.index = index
        self.limit = limit
    }
    
    static var next: (TestPageDescriptor) -> TestPageDescriptor = { page in
        return TestPageDescriptor(index: page.index + 1, limit: page.limit)
    }
    
    static var first: (TestPageDescriptor) -> TestPageDescriptor = { page in
        return TestPageDescriptor(index: 1, limit: page.limit)
    }
}

extension TestPageDescriptor: Equatable {
    public static func == (lhs: TestPageDescriptor, rhs: TestPageDescriptor) -> Bool {
        return lhs.index == rhs.index;
    }
}
