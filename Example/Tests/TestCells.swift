//
//  TestCells.swift
//  CappsoftKit
//
//  Created by Krzysztof Kapitan on 25.12.2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import CappsoftKit

class ReusableCell: UITableViewCell, Reusable {}

class ReusableNibLoadableCell: UITableViewCell, Reusable, NibLoadable {
    static var bundle: Bundle {
        return Bundle(for: self)
    }
}

class CellTypeCell: UITableViewCell, CellType {
    typealias ViewModel = CellViewModelTypeViewModel
    
    func populateWithViewModel(viewModel: CellViewModelTypeViewModel) {
        textLabel?.text = viewModel.labelText
    }
}
