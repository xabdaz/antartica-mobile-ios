//
//  DetailUserCoordinator.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 27/10/21.
//

import Foundation
import UIKit
import RxSwift

public class DetailUserCoordinator: SZCoordinator {
    
    private let disposeBag = DisposeBag()
    private let viewModel: DetailUserViewModel
    public init(viewModel: DetailUserViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    public override func start() {
        let viewController = DetailUserVC(viewModel: self.viewModel)
        self.navigation.topViewController?.present(viewController, animated: true, completion: nil)
    }
    public override func setupBinding() {
        self.viewModel.didFinishCoordinator
            .bind(to: self.didFinish)
            .disposed(by: self.disposeBag)
    }
}
