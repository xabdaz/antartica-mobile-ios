//
//  Containter+Extension.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 23/10/21.
//

import Swinject
import SwinjectAutoregistration
extension Container {
    func registerDependencies() {
        registerServices()
        registerCoordinators()
        registerViewModels()
    }
}

extension Container {
    func registerCoordinators() {
        autoregister(AppCoordinator.self, initializer: AppCoordinator.init)
        autoregister(ListCoordinator.self, initializer: ListCoordinator.init)
    }
}

extension Container {
    func registerServices() {
        autoregister(SessionService.self, initializer: SessionService.init).inObjectScope(.container)
    }
}

extension Container {
    func registerViewModels() {
        autoregister(ListPostViewModel.self, initializer: ListPostViewModel.init)
    }
}
