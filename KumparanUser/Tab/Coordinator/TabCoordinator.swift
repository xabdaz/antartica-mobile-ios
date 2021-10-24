//
//  TabCoordinator.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 24/10/21.
//

import UIKit
import RxSwift

public class TabCoordinator: SZCoordinator {

    private let disposeBag = DisposeBag()
    private let viewModel: TabViewModel
    private let postViewModel: ListPostViewModel
    public init(viewModel: TabViewModel, postViewModel: ListPostViewModel) {
        self.viewModel = viewModel
        self.postViewModel = postViewModel
        super.init()
    }
    public override func start() {
        let viewController = TabBarVC(viewModel: self.viewModel)
        navigation.viewControllers = [viewController]
    }

    public override func setupBinding() {
        let viewControllers = [self.getPostViewController()]
        self.viewModel.didViewController.accept(viewControllers)

        self.postViewModel.didDetail
            .bind { [weak self] in
                self?.navigateToDetail()
            }.disposed(by: self.disposeBag)
    }
}

// MARK: ViewController
private extension TabCoordinator {
    private func getPostViewController() -> SZViewController {
        let viewController = ListPostVC(viewModel: self.postViewModel)
        viewController.title = "Post"
        let item = UITabBarItem(title: "Post", image: UIImage(named: "tabBarPost"), selectedImage: UIImage(named: "tabBarPost"))
        viewController.tabBarItem = item
        return viewController
    }
}

// MARK: Navigation
extension TabCoordinator {
    public func navigateToDetail() {
        let coordinator = AppDelegate.container.resolve(DetailPostCoordinator.self)
        coordinator?.navigationController = self.navigation
        self.start(coordinator: coordinator)
    }
}
