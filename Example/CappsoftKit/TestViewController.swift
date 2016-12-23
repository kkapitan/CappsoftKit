//
//  ViewController.swift
//  CappsoftKit
//
//  Created by Krzysztof on 12/23/2016.
//  Copyright (c) 2016 Krzysztof. All rights reserved.
//

import UIKit
import CappsoftKit

class TestViewController : UITableViewController {
    var dataSource: TableDataSource<MyCell, Provider<SampleDataFetcher>>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    private func setupTableView() {
        setupDataSource()
        
        tableView.register(cell: MyCell.self)
        tableView.dataSource = dataSource
        
        dataSource?.provider.loadItems { [weak self] _ in
            self?.tableView.reloadData()
        }
    }
    
    private func setupDataSource() {
        let fetcher = SampleDataFetcher()
        let provider = Provider<SampleDataFetcher>(fetcher: fetcher)

        dataSource = TableDataSource<MyCell, Provider<SampleDataFetcher>>(provider:provider)
    }
}

