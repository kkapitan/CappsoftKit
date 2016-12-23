//
//  MyCell.swift
//  CappsoftKit
//
//  Created by Krzysztof Kapitan on 23.12.2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import CappsoftKit

class MyCell : UITableViewCell, CellType {
    typealias ViewModel = MyCellViewModel
    
    func populateWithViewModel(viewModel: MyCellViewModel) {
        textLabel?.text = viewModel.testLabelText
    }
}
