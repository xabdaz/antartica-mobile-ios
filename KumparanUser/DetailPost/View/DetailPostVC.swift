//
//  DetailPostVC.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 24/10/21.
//

import UIKit
import RxSwift

public class DetailPostVC: SZViewController {
    @IBOutlet var testLabel: UILabel!
    
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

        self.viewModel.outTitle
            .bind { [weak self] text in
                self?.title = text
                self?.testLabel.text = text
            }.disposed(by: self.disposeBag)
        // Do any additional setup after loading the view.
    }

}
