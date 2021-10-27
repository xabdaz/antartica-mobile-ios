//
//  DetailPostCoordinator.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 24/10/21.
//

import RxSwift

public class DetailPostCoordinator: SZCoordinator {
    private let disposeBag = DisposeBag()
    
    public let viewModel: DetailPostViewModel
    public init(viewModel: DetailPostViewModel) {
        self.viewModel =  viewModel
        super.init()
    }
    public override func start() {
        let viewController = DetailPostVC(viewModel: self.viewModel)
        self.navigation.pushViewController(viewController, animated: true)
    }

    public override func setupBinding() {
        self.viewModel.inTableSelected
            .bind { [weak self] _ in
                self?.navigateToDetailUser()
            }.disposed(by: self.disposeBag)
        
        self.viewModel.didFinishCoordinator
            .bind(to: self.didFinish)
            .disposed(by: self.disposeBag)
    }
}

extension DetailPostCoordinator {
    private func navigateToDetailUser() {
        let coordinator = AppDelegate.container.resolve(DetailUserCoordinator.self)
        coordinator?.navigationController = self.navigation
        self.start(coordinator: coordinator)
    }
}
