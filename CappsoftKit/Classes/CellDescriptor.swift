//
//  CellDescriptor.swift
//  Pods
//
//  Created by Krzysztof Kapitan on 28.12.2016.
//
//

import UIKit

public class CellDescriptor<T> {
    let cellClass: UITableViewCell.Type
    let reuseIdentifier: String
    
    let configureCell: (UITableViewCell, IndexPath, T) -> ()
    
    public init<Base: UITableViewCell>(cellClass: Base.Type, configure: @escaping (Base, IndexPath, T) -> ()) where Base: CellType, Base.ViewModel.Model == T {
        self.cellClass = cellClass
        self.reuseIdentifier = cellClass.reuseIdentifier
        self.configureCell = { cell, indexPath, model in
            configure(cell as! Base, indexPath, model)
        }
    }
    
    public convenience init<Base: UITableViewCell>(cellClass: Base.Type) where Base: CellType, Base.ViewModel.Model == T {
        let configure: (Base, IndexPath, T) -> () = { cell, _, model in
            let viewModel = Base.ViewModel(model: model)
            cell.populateWithViewModel(viewModel: viewModel)
        }
        self.init(cellClass: cellClass, configure: configure)
    }
}

