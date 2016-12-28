//
//  ViewController.swift
//  CappsoftKit
//
//  Created by Krzysztof on 12/23/2016.
//  Copyright (c) 2016 Krzysztof. All rights reserved.
//

import UIKit
import CappsoftKit

let MyCellDescriptor = CellDescriptor<String>(cellClass: MyCell.self)
let MySecondCellDescriptor = CellDescriptor<String>(cellClass: MySecondCell.self)

class TestViewController : UITableViewController {
    var dataSource: TableDataSource<Provider<SamplePagedDataFetcher>>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    private func setupTableView() {
        setupDataSource()
        
        tableView.register(cell: MyCell.self)
        tableView.register(cell: MySecondCell.self)
        
        tableView.dataSource = dataSource
        
        dataSource?.provider.loadItems { [weak self] _ in
            self?.tableView.reloadData()
        }
        
        dataSource?.provider.loadMore(completion: { [weak self] _ in
            self?.tableView.reloadData()
        })

        dataSource?.provider.loadMore(completion: { [weak self] _ in
            self?.tableView.reloadData()
        })

    }
    
    private func setupDataSource() {
        let fetcher = SamplePagedDataFetcher(page: Page(index:1, limit: 10))
        let provider = Provider<SamplePagedDataFetcher>(fetcher: fetcher)
        
        dataSource = TableDataSource<Provider<SamplePagedDataFetcher>>(provider: provider) { _, indexPath in
            return indexPath.row % 2 == 0 ? MyCellDescriptor : MySecondCellDescriptor
        }
    }
}
