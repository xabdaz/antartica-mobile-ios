//
//  ListPostVC.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 23/10/21.
//

import UIKit
import RxSwift
import RxDataSources

class ListPostVC: SZViewController {

    @IBOutlet var tableView: SZTableView!

    private typealias TableData = SZSectionSection<ListPostViewData>
    private typealias DataSourceModel = SectionModel<String, TableData>

    private let disposeBag = DisposeBag()
    private lazy var dataSource = RxTableViewSectionedReloadDataSource<DataSourceModel>(
        configureCell: { [weak self] (_, tableView, indexPath, item) in
            guard let `self` = self else { return UITableViewCell() }
            switch item {
            case let .item(item, identifier: identifier):
                return self.getPostCell(tableView, indexPath, item)
            case let .loading(identifier: identifier):
                return UITableViewCell()
            }
        }, titleForHeaderInSection: { ds, section in return ds[section].identity }
    )
    
    private let viewModel: ListPostViewModel
    init(viewModel: ListPostViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupUI()
        self.setupOutPutBindings()
        self.setupInputBindings()
        self.viewModel.loadData()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    @IBAction func testPassingData(_ sender: Any) {
//        AppDelegate.container.register(ListPostViewData.self) { _ in }
        self.viewModel.didDetail.onNext(())
    }
    override func onFinishCoordinator() {
        self.viewModel.didFinishCoordinator.onNext(())
    }
}
extension ListPostVC {
    func setupUI() {
        ListPostCell.registerTo(tableView: self.tableView)

        self.tableView.rx
            .setDelegate(self)
            .disposed(by: self.disposeBag)
    }

    func setupOutPutBindings() {
        self.viewModel.outTabelData
            .bind(to: self.tableView.rx.items(dataSource: self.dataSource))
            .disposed(by: self.disposeBag)
    }

    func setupInputBindings() {
        self.tableView.rx.modelSelected(TableData.self)
            .bind(to: self.viewModel.inTableSelected)
            .disposed(by: self.disposeBag)
    }
}

extension ListPostVC: UITableViewDelegate {

    private func getPostCell(
        _ tableView: UITableView,
        _ indexPath: IndexPath,
        _ model: ListPostViewData
    ) -> ListPostCell {
        let cell = ListPostCell.dequeue(tableView: tableView, indexPath: indexPath)
        cell.setContent(model: model)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch dataSource[section].items.first {
        case .item:
            return 0.001
        default:
            return UITableView.automaticDimension
        }
    }
}
