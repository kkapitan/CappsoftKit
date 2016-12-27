//
//  Reusable.swift
//  Pods
//
//  Created by Krzysztof Kapitan on 23.12.2016.
//
//

import UIKit

public protocol Reusable {
    static var reuseIdentifier: String { get }
}

public extension Reusable where Self: UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
