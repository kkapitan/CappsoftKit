//
//  TableViewExtensions.swift
//  Pods
//
//  Created by Krzysztof Kapitan on 23.12.2016.
//
//

import UIKit

public extension UITableView {
    
    func register<T: UITableViewCell> (cell: T.Type) where T: Reusable {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func register<T: UITableViewCell> (cell: T.Type) where T: Reusable, T: NibLoadable {
        register(T.nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
}

public extension UITableView {
    
    func dequeueCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath? = nil) -> T  where T: Reusable {
        return indexPath
            .flatMap( { (dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: $0) as! T) })
            ?? dequeueReusableCell(withIdentifier: T.reuseIdentifier) as! T
    }
}
