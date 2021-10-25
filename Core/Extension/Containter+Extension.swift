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
        autoregister(TabCoordinator.self, initializer: TabCoordinator.init)
        autoregister(DetailPostCoordinator.self, initializer: DetailPostCoordinator.init)
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
        autoregister(TabViewModel.self, initializer: TabViewModel.init)
        autoregister(DetailPostViewModel.self, initializer: DetailPostViewModel.init)
        autoregister(GaleriPostViewModel.self, initializer: GaleriPostViewModel.init)
        autoregister(UserViewModel.self, initializer: UserViewModel.init)
    }
}
