//
//  MySecondCell.swift
//  CappsoftKit
//
//  Created by Krzysztof Kapitan on 28.12.2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import CappsoftKit

class MySecondCell : UITableViewCell, CellType {
    typealias ViewModel = MySecondCellViewModel
    
    func populateWithViewModel(viewModel: MySecondCellViewModel) {
        textLabel?.text = viewModel.testLabelText
    }
}
