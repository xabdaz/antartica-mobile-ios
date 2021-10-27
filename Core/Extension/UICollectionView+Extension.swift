//
//  UICollectionView+Extension.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 25/10/21.
//

import Foundation

import UIKit
extension UICollectionViewCell {
    class var identifier: String {
        return "\(self)"
    }

    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    static func registerTo(collectionView: UICollectionView) {
        collectionView.register(nib, forCellWithReuseIdentifier: identifier)
    }
    
    static func dequeue(collectionView: UICollectionView, indexPath: IndexPath) -> Self {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        guard let result = cell as? Self else { return Self() }
        return result
    }
}
