//
//  GaleriPostVC.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 24/10/21.
//

import UIKit

public class GaleriPostVC: SZViewController {

    @IBOutlet var collectionView: SZCollectionView!

    private let viewModel: GaleriPostViewModel
    public init(viewModel: GaleriPostViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.registerCellIdentifiers(cellIdentifiers: [GaleriImageCell.self])
        self.collectionView.delegate = self
        var item = SZCollectionViewSection()
        let items = [UIImage(named: "tabBarGalery"), UIImage(named: "tabBarPost"),UIImage(named: "tabBarGalery"), UIImage(named: "tabBarPost"),UIImage(named: "tabBarGalery"), UIImage(named: "tabBarPost"),UIImage(named: "tabBarGalery"), UIImage(named: "tabBarPost")]
        
        item.setItems(items: items as [Any])
        self.collectionView.setSection(section: item)
        
        self.collectionView.setNumberOfColumn(numberOfColumn: 2, multiplierHeight: 1.5, sectionInset: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0), minimumSpacing: 8)
    }

}

extension GaleriPostVC: SZCollectionViewDelegate {
    public func collectionView(_ didSelectItemAtcollectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
    public func collectionView(object: Any, _ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell = GaleriImageCell.dequeue(collectionView: collectionView, indexPath: indexPath)
        let image = object as? UIImage
        cell.imageView.image = image
        return cell
    }
    
    public func collectionView(_ didSelectItemAtcollectionView: UICollectionView, object: Any) {
    }
    
    
}
