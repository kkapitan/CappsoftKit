//
//  TableDataSource.swift
//  Pods
//
//  Created by Krzysztof Kapitan on 23.12.2016.
//
//

import UIKit

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
