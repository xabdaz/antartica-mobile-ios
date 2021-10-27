//
//  SZCollectionViewSection.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 25/10/21.
//

import Foundation
public struct SZCollectionViewSection {
    
    private var title: String = ""
    private var items: [Any] = []
    
    public func numberOfItems() -> Int {
        return items.count
    }
    
    public func hasItemAtIndex(index: Int) -> Bool {
        return index < items.count
    }
    
    public mutating func appendItem(item: Any) {
        items.insert(item, at: items.count)
    }
    
    public mutating func setItems(items: [Any]) {
        self.items = items
    }

    public mutating func setTitle(title: String) {
        self.title = title
    }
    
    public func getItemAtIndex(index: Int) -> Any {
        if hasItemAtIndex(index: index) {
            return items[index]
        }
        return NSObject()
    }
    
}
