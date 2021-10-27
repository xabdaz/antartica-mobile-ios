//
//  SZCollectionView.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 24/10/21.
//

import UIKit
public protocol SZCollectionViewDelegate: AnyObject {

    dynamic func collectionView(object: Any, _ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
    dynamic func collectionView(_ didSelectItemAtcollectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    dynamic func collectionView(_ didSelectItemAtcollectionView: UICollectionView, object: Any)
}

open class SZCollectionView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private var sections: [SZCollectionViewSection] = []
    public weak var delegate: SZCollectionViewDelegate?

    private let collectionView: UICollectionView
    public override init(frame: CGRect) {
        self.collectionView = UICollectionView(frame: frame, collectionViewLayout: UICollectionViewFlowLayout())
        super.init(frame: frame)
    }
    
    required public init?(coder: NSCoder) {
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        super.init(coder: coder)
    }

    open override func awakeFromNib() {
        super.awakeFromNib()
        self.setupView()
    }
    private func hasSectionAtIndex(index: Int) -> Bool {
        return index < sections.count
    }

    public func appendSection(section: SZCollectionViewSection) {
        self.sections.append(section)
        self.reloadData()
    }

    public func setSection(section: SZCollectionViewSection) {
        self.sections.removeAll()
        self.sections.append(section)
        self.reloadData()
    }

    public func setSections(sections: [SZCollectionViewSection]) {
        self.sections = sections
        self.reloadData()
    }

    private func reloadData() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }

    public func removeSection(index: Int = 0, all: Bool = false) {
        guard !sections.isEmpty else { return }
        if all { sections.removeAll() }
        else { sections.remove(at: index) }
    }

    func setupView() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        self.addSubview(collectionView)
        collectionView.edges(to: self)
    }

    open func setLayout(
        itemSize: CGSize,
        sectionInset: UIEdgeInsets,
        minimumSpacing: CGFloat,
        scrollDirection: UICollectionView.ScrollDirection
    ) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = scrollDirection
        layout.itemSize = itemSize
        layout.sectionInset = sectionInset
        layout.minimumLineSpacing = minimumSpacing
        layout.minimumInteritemSpacing = minimumSpacing
        collectionView.collectionViewLayout = layout
    }

    func setNumberOfColumn(
        numberOfColumn: Int,
        multiplierHeight: CGFloat,
        sectionInset: UIEdgeInsets, minimumSpacing: CGFloat
    ) {
        var itemViewSize: CGSize = CGSize.zero
        itemViewSize.width = SizeUtils.getWidthGrid(
            containerWidth: UIScreen.main.bounds.width,
            horizontalPadding: sectionInset.left,
            columnSpacing: minimumSpacing,
            columnCount: numberOfColumn
        )

        itemViewSize.height = itemViewSize.width * multiplierHeight
        self.setLayout(
            itemSize: itemViewSize,
            sectionInset: sectionInset,
            minimumSpacing: minimumSpacing,
            scrollDirection: .horizontal
        )
    }

    public func registerCellIdentifiers(cellIdentifiers: [UICollectionViewCell.Type]) {
        for cellIdentifier in cellIdentifiers {
            cellIdentifier.registerTo(collectionView: collectionView)
        }
    }

    open func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return sections.count
    }

    open func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        if hasSectionAtIndex(index: section) {
            return sections[section].numberOfItems()
        }
        return 0
    }

    open func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let objcet = self.sections[indexPath.section].getItemAtIndex(index: indexPath.row)
        guard let cell = self.delegate?.collectionView(object: objcet, collectionView, indexPath: indexPath) else {
            return UICollectionViewCell()
        }
        return cell
    }

    open func collectionView(
        _ didSelectItemAtcollectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        if let delegate = self.delegate {
            let item = sections[indexPath.section].getItemAtIndex(index: indexPath.row)
            delegate.collectionView(didSelectItemAtcollectionView, object: item)
            delegate.collectionView(didSelectItemAtcollectionView, didSelectItemAt: indexPath)
        }
    }
}
