//
//  SZCollectionViewSection.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 25/10/21.
//

import Foundation
public struct SZCollectionViewSection {
    
    private var title: String = ""
    private var items: [AnyObject] = []
    
    public func numberOfItems() -> Int {
        return items.count
    }
    
    public func hasItemAtIndex(index: Int) -> Bool {
        return index < items.count
    }
    
    public mutating func appendItem(item: AnyObject) {
        items.insert(item, at: items.count)
    }
    
    public mutating func setItems(items: [AnyObject]) {
        self.items = items
    }

    public mutating func setTitle(title: String) {
        self.title = title
    }
    
    public func getItemAtIndex(index: Int) -> AnyObject {
        if hasItemAtIndex(index: index) {
            return items[index]
        }
        return NSObject()
    }
    
}
