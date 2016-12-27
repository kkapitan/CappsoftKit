//
//  MySecondCellViewModel.swift
//  CappsoftKit
//
//  Created by Krzysztof Kapitan on 28.12.2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import CappsoftKit

struct MySecondCellViewModel: CellViewModelType {
    typealias Model = String
    
    let testLabelText: String
    
    init(model: String) {
        testLabelText = "Second cell: \(model)"
    }
}
