//
//  AlbumCell.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 27/10/21.
//

import UIKit
import RxSwift

class AlbumCell: SZTableViewCell {

    private let viewModel = AppDelegate.container.resolve(AlbumViewModel.self)
    let disposeBag = DisposeBag()
    let didImage = PublishSubject<ImageViewData>()
    
    @IBOutlet var heightTableView: NSLayoutConstraint!
    @IBOutlet var tableView: SZTableView!
    @IBOutlet var titleLabel: UILabel!

    private var isCreated = false
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.setupUI()
        self.setupOutputBindings()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func setContent(model: UserViewData) {
        self.titleLabel.text = model.name

        guard !self.isCreated else { return }
        self.isCreated = true
        self.viewModel?.getAlbum(id: model.model.id ?? 0)
    }
    
}

private extension AlbumCell {
    func setupUI() {
        ImageCell.registerTo(tableView: tableView)
        self.tableView.setWrap(contraint: heightTableView)
            .bind { [weak self] height in
                self?.baseTabelView?.beginUpdates()
                self?.heightTableView.constant = height
                self?.baseTabelView?.endUpdates()
            }.disposed(by: self.disposeBag)

    }

    func setupOutputBindings() {
        guard let viewmodel = self.viewModel else { return }
        viewmodel.outTableView
            .bind(to: self.tableView.rx.items(
                cellIdentifier: ImageCell.identifier, cellType: ImageCell.self
            )) { [weak self] _, model, cell in
                cell.setContent(model: model)
                guard let `self` = self else { return }
                cell.didImage
                    .bind(to: self.didImage)
                    .disposed(by: cell.disposeBag)
            }.disposed(by: self.disposeBag)
    }
}
