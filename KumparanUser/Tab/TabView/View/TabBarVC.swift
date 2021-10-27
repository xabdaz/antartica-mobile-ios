//
//  TabBarVC.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 24/10/21.
//

import UIKit
import RxSwift

public class TabBarVC: UITabBarController, UITabBarControllerDelegate {

    
    private let disposeBag = DisposeBag()
    
    private let viewModel: TabViewModel
    public init(viewModel: TabViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "\(TabBarVC.self)", bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        self.setupUI()
        self.setupBinding()
    }
    public func tabBarController(
        _ tabBarController: UITabBarController,
        shouldSelect viewController: UIViewController
    ) -> Bool {
        return true
    }

    public override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        self.title = item.title
    }
}

extension TabBarVC {
    private func setupUI() {
        UITabBar.appearance().tintColor = .black
    }
    private func setupBinding() {
        self.viewModel.didViewController
            .bind(to: self.rx.viewControllers)
            .disposed(by: self.disposeBag)
    }
}
