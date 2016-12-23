//
//  CellType.swift
//  Pods
//
//  Created by Krzysztof Kapitan on 23.12.2016.
//
//

import Foundation

public protocol CellType: Reusable {
    associatedtype ViewModel : CellViewModelType
    
    func populateWithViewModel(viewModel: ViewModel)
}

public protocol CellViewModelType {
    associatedtype Model
    
    init(model: Model)
}
