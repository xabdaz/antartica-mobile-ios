//
//  DetailPostVC.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 24/10/21.
//

import UIKit
import RxSwift

public class DetailPostVC: SZViewController {
    @IBOutlet var heightTableview: NSLayoutConstraint!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var userLabel: UILabel!
    @IBOutlet var tableView: SZTableView!
    @IBOutlet var descriptionLabel: UILabel!
    private let disposeBag = DisposeBag()
    private let viewModel: DetailPostViewModel
    public init(viewModel: DetailPostViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Post"
        self.setupUI()
        self.setupInputBindings()
        self.setupOutputBindings()
        self.viewModel.getComment()
        // Do any additional setup after loading the view.
    }

    public override func onFinishCoordinator() {
        
        self.viewModel.didFinishCoordinator.onNext(())
    }

}
extension DetailPostVC {
    func setupUI() {
        CommentCell.registerTo(tableView: self.tableView)
        self.tableView.setWrapContent(contraint: self.heightTableview, disposable: self.disposeBag)
    }

    func setupInputBindings() {
        self.tableView.rx.modelSelected(CommentModel.self)
            .bind(to: self.viewModel.inTableSelected)
            .disposed(by: self.disposeBag)
    }

    func setupOutputBindings() {
        self.viewModel.outUser
            .bind(to: self.userLabel.rx.text)
            .disposed(by: self.disposeBag)
        
        self.viewModel.outTitle
            .bind(to: self.titleLabel.rx.text)
            .disposed(by: self.disposeBag)

        self.viewModel.outDescription
            .bind(to: self.descriptionLabel.rx.text)
            .disposed(by: self.disposeBag)
    
        self.viewModel.outTable
            .bind(to: self.tableView.rx.items(
                cellIdentifier: CommentCell.identifier, cellType: CommentCell.self
            )) { _, model, cell in
                cell.setContent(model: model)
            }.disposed(by: self.disposeBag)
    }
   
}
