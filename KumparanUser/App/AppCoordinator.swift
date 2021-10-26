//
//  AppCoordinator.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 23/10/21.
//

import RxSwift
import UIKit

public class AppCoordinator: SZCoordinator {
    
    private let disposeBag = DisposeBag()
    private let sessionService: SessionService
    private var window = UIWindow(frame: UIScreen.main.bounds)
    public init(sessionService: SessionService) {
        self.sessionService = sessionService
        super.init()
    }

    public override func start() {
        window.makeKeyAndVisible()
        self.navigateToLaunch()
        self.sessionService.fetchSession()
    }

    private func navigateToTabBar() {
        removeChildCoordinators()
        let coordinator = AppDelegate.container.resolve(TabCoordinator.self)
        self.start(coordinator: coordinator)

        ViewControllerUtils.setRootViewController(
            window: window,
            viewController: coordinator?.navigationController ?? UIViewController(),
            withAnimation: true
        )
    }

    private func navigateToLaunch() {
        removeChildCoordinators()
        let coordinator = AppDelegate.container.resolve(LaunchCoordinator.self)
        self.start(coordinator: coordinator)

        ViewControllerUtils.setRootViewController(
            window: window,
            viewController: coordinator?.navigationController ?? UIViewController(),
            withAnimation: true
        )

    }

    public override func setupBinding() {
        self.sessionService.didUser
            .bind { [weak self] _ in
                self?.navigateToTabBar()
            }.disposed(by: self.disposeBag)
    }
}
