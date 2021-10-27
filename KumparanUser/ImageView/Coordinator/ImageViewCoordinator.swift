//
//  ImageViewCoordinator.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 27/10/21.
//

import RxSwift


public class ImageViewCoordiantor: SZCoordinator {
    private let disposeBag = DisposeBag()
    private let viewModel: ImageViewViewModel
    public init(viewModel: ImageViewViewModel) {
        self.viewModel = viewModel
    }

    public override func start() {
        let viewController = ImageViewVC(viewModel: self.viewModel)
        self.navigation.pushViewController(viewController, animated: true)
    }
    public override func setupBinding() {
        self.viewModel.didFinishCoordinator
            .bind(to: self.didFinish)
            .disposed(by: self.disposeBag)
    }
}
