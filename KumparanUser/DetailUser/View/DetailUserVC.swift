//
//  DetailUserVC.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 27/10/21.
//

import UIKit

public class DetailUserVC: SZViewController {
    private let viewModel: DetailUserViewModel
    init(viewModel: DetailUserViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    public override func onFinishCoordinator() {
        self.viewModel.didFinishCoordinator.onNext(())
    }
}
