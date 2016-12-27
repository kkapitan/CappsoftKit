//
//  TableDataSource.swift
//  Pods
//
//  Created by Krzysztof Kapitan on 23.12.2016.
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

public class TableDataSource<Provider: DataProvidable> : DataSource<Provider>, UITableViewDataSource {
    public typealias Descriptor = CellDescriptor<Provider.Element>
    public typealias DescriptorSelector = (Provider.Element, IndexPath) -> Descriptor
    
    let descriptorSelector: DescriptorSelector
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = itemAtIndexPath(indexPath)!
        let descriptor = descriptorSelector(model, indexPath)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: descriptor.reuseIdentifier)!
        descriptor.configureCell(cell, indexPath, model)
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count()
    }
    
    
    public init(provider: Provider, descriptorSelector: @escaping DescriptorSelector) {
        self.descriptorSelector = descriptorSelector
        super.init(provider: provider)
    }
    
    public convenience init(provider: Provider, descriptor: Descriptor) {
        let descriptorSelector: DescriptorSelector = { _ in
            return descriptor
        }
        self.init(provider: provider, descriptorSelector: descriptorSelector)
    }
}
