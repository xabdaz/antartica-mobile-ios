//
//  ListPostVC.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 23/10/21.
//

import UIKit

class ListPostVC: SZViewController {

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
        AppDelegate.container.register(ListModel.self) { _ in ListModel(id: "Hai") }
        self.viewModel.didDetail.onNext(())
    }
}
