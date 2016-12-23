//
//  MyCellViewModel.swift
//  CappsoftKit
//
//  Created by Krzysztof Kapitan on 23.12.2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import CappsoftKit

struct MyCellViewModel: CellViewModelType {
    typealias Model = String
    
    let testLabelText: String
    
    init(model: String) {
        testLabelText = model
    }
}
