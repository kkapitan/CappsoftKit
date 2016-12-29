//
//  NibLoadable.swift
//  Pods
//
//  Created by Krzysztof Kapitan on 23.12.2016.
//
//

import Foundation

public protocol NibLoadable : class {
    static var nibName: String { get }
    static var bundle: Bundle { get }
}

public extension NibLoadable {
    static var nib: UINib {
        return UINib(nibName: nibName, bundle: bundle)
    }
    
    static var bundle: Bundle {
        return Bundle.main
    }
}

public extension NibLoadable where Self: UIView {
    static var view: Self? {
        return bundle.loadNibNamed(nibName, owner: nil, options: nil)?[0] as? Self
    }
}

public extension NibLoadable where Self: Reusable {
    static var nibName: String {
        return Self.reuseIdentifier
    }
}
