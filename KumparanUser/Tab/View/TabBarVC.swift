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
        self.setupBinding()
    }
    public func tabBarController(
        _ tabBarController: UITabBarController,
        shouldSelect viewController: UIViewController
    ) -> Bool {
           return true
       }
}
extension TabBarVC {
    private func setupBinding() {
        self.viewModel.didViewController
            .bind { [weak self] vc in
                self?.viewControllers = vc
            }.disposed(by: self.disposeBag)
    }
}
