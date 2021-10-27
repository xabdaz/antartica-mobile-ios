//
//  GaleriPostVC.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 24/10/21.
//

import UIKit
import RxSwift

public class GaleriPostVC: SZViewController {

    private let disposeBag = DisposeBag()

    @IBOutlet var tableView: SZTableView!

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
        self.setupUI()
        self.setupOutputBindings()
        self.viewModel.setupData()
    }
    public override func onFinishCoordinator() {
        self.viewModel.didFinishCoordinator.onNext(())
    }

}
extension GaleriPostVC {
    func setupUI() {
        AlbumCell.registerTo(tableView: self.tableView)
    }
    func setupOutputBindings() {
        self.viewModel.outTableView
            .bind(to: self.tableView.rx.items(
                cellIdentifier: AlbumCell.identifier, cellType: AlbumCell.self
            )) { [weak self] _, model, cell in
                cell.setContent(model: model)
                guard let `self` = self else { return }
                cell.didImage
                    .bind(to: self.viewModel.inImageData)
                    .disposed(by: cell.disposeBag2)
            }.disposed(by: self.disposeBag)
    }
}
