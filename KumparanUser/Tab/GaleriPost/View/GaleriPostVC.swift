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

}
extension GaleriPostVC {
    func setupUI() {
        AlbumCell.registerTo(tableView: self.tableView)
    }
    func setupOutputBindings() {
        self.viewModel.outTableView
            .bind(to: self.tableView.rx.items(
                cellIdentifier: AlbumCell.identifier, cellType: AlbumCell.self
            )) { _, model, cell in
                cell.setContent(model: model)
            }.disposed(by: self.disposeBag)
    }
}
