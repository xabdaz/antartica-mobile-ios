//
//  ImageCell.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 27/10/21.
//

import UIKit
import RxSwift

class ImageCell: SZTableViewCell {
    
    private let disposeBag = DisposeBag()
    private let viewModel = AppDelegate.container.resolve(ImageViewModel.self)

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var collectionView: SZCollectionView!

    private var isCreated = false
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
        self.setupOutputBindings()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setContent(model: AlbumViewData) {
        self.titleLabel.text = model.title

        guard !self.isCreated else { return }
        self.isCreated = true
        self.viewModel?.getPhotos(albumId: model.model.id ?? 0)
    }
    func setupOutputBindings() {
        guard let viewmodel = self.viewModel else { return }
        viewmodel.outTableView
            .bind { [weak self] model in
                var item = SZCollectionViewSection()
                item.setItems(items: model as [Any])
                self?.collectionView.setSection(section: item)
            }.disposed(by: self.disposeBag)
    }
}
extension ImageCell: SZCollectionViewDelegate {
    func setupUI() {
        self.collectionView.registerCellIdentifiers(cellIdentifiers: [GaleriImageCell.self])
        self.collectionView.setLayout(
            itemSize: CGSize(
                width: 150,
                height: 150
            ),
            sectionInset: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 10),
            minimumSpacing: 10,
            scrollDirection: .horizontal
        )
        self.collectionView.delegate = self
    }

    // MARK: SZCollectionViewDelegate
    func collectionView(object: Any, _ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell = GaleriImageCell.dequeue(collectionView: collectionView, indexPath: indexPath)
        cell.imageView.backgroundColor = .red
        return cell
    }
    
    func collectionView(
        _ didSelectItemAtcollectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
    }
    
    func collectionView(
        _ didSelectItemAtcollectionView: UICollectionView,
        object: Any
    ) {
    }
    
    
}
