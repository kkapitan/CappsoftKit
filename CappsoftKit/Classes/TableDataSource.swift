//
//  TableDataSource.swift
//  Pods
//
//  Created by Krzysztof Kapitan on 23.12.2016.
//
//

import UIKit

public class TableDataSource<Cell: CellType, Provider: DataProvidable> : DataSource<Cell, Provider>, UITableViewDataSource where Cell: UITableViewCell, Cell.ViewModel.Model == Provider.Element {
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(forIndexPath: indexPath) as Cell
        
        let item = itemAtIndexPath(indexPath)!
        let viewModel = Cell.ViewModel(model: item)
        
        cell.populateWithViewModel(viewModel: viewModel)
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count()
    }
}
