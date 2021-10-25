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
    private let galeriViewModel: GaleriPostViewModel
    public init(viewModel: TabViewModel, postViewModel: ListPostViewModel, galeriViewModel: GaleriPostViewModel) {
        self.viewModel = viewModel
        self.postViewModel = postViewModel
        self.galeriViewModel = galeriViewModel
        super.init()
    }
    public override func start() {
        let viewController = TabBarVC(viewModel: self.viewModel)
        navigation.viewControllers = [viewController]
    }

    public override func setupBinding() {
        let viewControllers = [self.getPostViewController(), self.getGaleriViewController()]
        self.viewModel.didViewController.accept(viewControllers)

        self.postViewModel.didDetail
            .bind { [weak self] in
                self?.navigateToDetail()
            }.disposed(by: self.disposeBag)
    }
}

// MARK: ViewController
private extension TabCoordinator {
    private func getPostViewController() -> ListPostVC {
        let viewController = ListPostVC(viewModel: self.postViewModel)
        viewController.title = "Post"
        let item = UITabBarItem(title: "Post", image: UIImage(named: "tabBarPost"), selectedImage: UIImage(named: "tabBarPost"))
        viewController.tabBarItem = item
        return viewController
    }

    private func getGaleriViewController() -> GaleriPostVC {
        let viewController = GaleriPostVC(viewModel: self.galeriViewModel)
        viewController.title = "Galeri"
        let item = UITabBarItem(title: "Galeri", image: UIImage(named: "tabBarGalery"), selectedImage: UIImage(named: "tabBarGalery"))
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
