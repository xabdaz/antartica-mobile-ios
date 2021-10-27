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
        autoregister(LaunchCoordinator.self, initializer: LaunchCoordinator.init)
    }
}

extension Container {
    func registerServices() {
        autoregister(HttpClient.self, initializer: HttpClientProduction.init)
        autoregister(BackendRestClient.self, initializer: BackendRestClient.init)
        autoregister(SessionService.self, initializer: SessionService.init).inObjectScope(.container)
        autoregister(DataManager.self, initializer: UserDataManager.init)
        autoregister(DetailUserCoordinator.self, initializer: DetailUserCoordinator.init)
        autoregister(ImageViewCoordiantor.self, initializer: ImageViewCoordiantor.init)
    }
}

extension Container {
    func registerViewModels() {
        autoregister(ListPostViewModel.self, initializer: ListPostViewModel.init)
        autoregister(TabViewModel.self, initializer: TabViewModel.init)
        autoregister(DetailPostViewModel.self, initializer: DetailPostViewModel.init)
        autoregister(GaleriPostViewModel.self, initializer: GaleriPostViewModel.init)
        autoregister(UserViewModel.self, initializer: UserViewModel.init)
        autoregister(LaunchViewModel.self, initializer: LaunchViewModel.init)
        autoregister(AlbumViewModel.self, initializer: AlbumViewModel.init)
        autoregister(ImageViewModel.self, initializer: ImageViewModel.init)
        autoregister(DetailUserViewModel.self, initializer: DetailUserViewModel.init)
        autoregister(ImageViewViewModel.self, initializer: ImageViewViewModel.init)
    }
}
