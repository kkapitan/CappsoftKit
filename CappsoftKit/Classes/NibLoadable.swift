//
//  NibLoadable.swift
//  Pods
//
//  Created by Krzysztof Kapitan on 23.12.2016.
//
//

import Foundation

public protocol NibLoadable {
    static var nibName: String { get }
}

public  extension NibLoadable {
    static var nib: UINib {
        return UINib(nibName: nibName, bundle: nil)
    }
}

public extension NibLoadable where Self: UIView {
    static var view: UIView? {
        return Bundle.main.loadNibNamed(nibName, owner: nil, options: nil) as? Self
    }
}

public extension NibLoadable where Self: Reusable {
    static var nibName: String {
        return Self.reuseIdentifier
    }
}
