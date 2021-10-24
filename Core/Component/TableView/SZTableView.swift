//
//  SZTableView.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 24/10/21.
//

import UIKit
class SZTableView: UITableView {
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {
        sectionHeaderHeight = UITableView.automaticDimension
        sectionFooterHeight = 0.001 // zero cannot implemented by swift
        rowHeight = UITableView.automaticDimension
        separatorStyle = .none
    }

    func reloadSectionWithoutAnimation(section: Int) {
        UIView.setAnimationsEnabled(false)
        self.beginUpdates()
        self.reloadSections(IndexSet(integer: section), with: .none)
        self.endUpdates()
        UIView.setAnimationsEnabled(true)
    }
}
