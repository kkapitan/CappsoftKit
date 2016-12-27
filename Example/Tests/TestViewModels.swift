//
//  TestViewModels.swift
//  CappsoftKit
//
//  Created by Krzysztof Kapitan on 25.12.2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import CappsoftKit

struct CellViewModelTypeViewModel: CellViewModelType {
    typealias Model = String
    
    let labelText: String
    
    init(model: String) {
        labelText = model
    }
}
