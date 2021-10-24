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

    private lazy var dataSource = RxTableViewSectionedReloadDataSource<DataSourceModel>(
        configureCell: { [weak self] (_, tableView, indexPath, item) in
            guard let `self` = self else { return UITableViewCell() }
            switch item {
            case let .item(item, identifier: identifier):
                return self.getPostCell()
            case let .loading(identifier: identifier):
                return self.getPostCell()
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

    }

    @IBAction func testPassingData(_ sender: Any) {
        AppDelegate.container.register(ListPostViewData.self) { _ in ListPostViewData(id: "Hai") }
        self.viewModel.didDetail.onNext(())
    }
}
extension ListPostVC {
    func setupUI() {
        
    }
}

extension ListPostVC: UITableViewDelegate {

    private func getPostCell() -> UITableViewCell {
        return UITableViewCell()
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
