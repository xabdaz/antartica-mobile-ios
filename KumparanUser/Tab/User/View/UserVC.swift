//
//  UserVC.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 26/10/21.
//

import UIKit
import RxSwift

public class UserVC: SZViewController {
    @IBOutlet var tableView: SZTableView!

    private let disposeBag = DisposeBag()
    private let viewModel: UserViewModel
    public init(viewModel: UserViewModel) {
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
extension UserVC {
    func setupUI() {
        UserCell.registerTo(tableView: self.tableView)
    }
    func setupOutputBindings() {
        self.viewModel.outTableView
            .bind(to: self.tableView.rx.items(
                cellIdentifier: UserCell.identifier, cellType: UserCell.self
            )) { _, model, cell in
                cell.setContent(model: model)
            }.disposed(by: self.disposeBag)
    }
}
