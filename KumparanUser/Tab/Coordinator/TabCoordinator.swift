//
//  TabCoordinator.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 24/10/21.
//

import UIKit

public class TabCoordinator: SZCoordinator {
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
    }
}

// MARK: ViewController
private extension TabCoordinator {
    private func getPostViewController() -> SZViewController {
        let viewController = ListPostVC(viewModel: self.postViewModel)
        let item = UITabBarItem(title: "Post", image: UIImage(named: "gallery 1"), selectedImage: UIImage(named: "gallery 1"))
        viewController.tabBarItem = item
        return viewController
    }
}