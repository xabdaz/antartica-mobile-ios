//
//  LaunchCoordinator.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 27/10/21.
//

import UIKit
import RxSwift

public class LaunchCoordinator: SZCoordinator {
    private let disposeBag = DisposeBag()
    private let viewModel: LaunchViewModel
    public init(viewModel: LaunchViewModel) {
        self.viewModel = viewModel
    }

    public override func start() {
        
        let viewController = LaunchVC(viewModel: self.viewModel)
        navigation.viewControllers = [viewController]
    }
    public override func setupBinding() {
        self.viewModel.didFinishCoordinator
            .bind(to: self.didFinish)
            .disposed(by: self.disposeBag)
    }
}
