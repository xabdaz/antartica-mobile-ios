//
//  SZCoordinator.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 23/10/21.
//

import UIKit
public protocol Coordinator: AnyObject {
    dynamic  var navigationController: UINavigationController { get set }
    dynamic var parentCoordinator: Coordinator? { get set }

    dynamic func start()
    dynamic func setupBinding()

    dynamic func start(coordinator: Coordinator)
    dynamic func didFinish(coordinator: Coordinator)
    dynamic func removeChildCoordinators()
    dynamic func didCloseView(
        animated: Bool,
        resultCode: Int,
        resultData: String?,
        _ completion: (() -> Void)?
    )
}
open class SZCoordinator: Coordinator {
    open var navigationController: UINavigationController = UINavigationController()
    
    public var childCoordinators = [Coordinator]()
    open var parentCoordinator: Coordinator?

    public var onRelease: ((_ resultCode: Int, _ data: String?) -> Void)?
    public var resultCode: Int = CoordinatorResult.CANCEL
    public var resultData: String?
    
    public init() {
        self.setupBinding()
    }

    open func start() {
        fatalError("Start method should be implemented.")
    }

    open func setupBinding() { }
    
    open func start(coordinator: Coordinator) {
        self.childCoordinators += [coordinator]
        coordinator.parentCoordinator = self
        coordinator.start()
    }
    
    open func didFinish(coordinator: Coordinator) {
        if let index = self.childCoordinators.firstIndex(where: { $0 === coordinator }) {
            self.childCoordinators.remove(at: index)
        }
    }
    
    open func removeChildCoordinators() {
        self.childCoordinators.forEach { $0.removeChildCoordinators() }
        self.childCoordinators.removeAll()
    }
    
    open func didCloseView(animated: Bool, resultCode: Int, resultData: String?, _ completion: (() -> Void)?) {
        self.resultCode = resultCode
        self.resultData = resultData
    }
    
    
}
public extension SZCoordinator {
    var navigation: UINavigationController {
        guard let navigation = navigationController.presentedViewController as? UINavigationController else {
            return self.navigationController
        }
        return navigation
    }
}
