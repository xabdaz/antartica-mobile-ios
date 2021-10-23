//
//  AppDelegate.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 23/10/21.
//

import UIKit
import CoreData
import Swinject

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    private var appCoordinator: AppCoordinator?

    static let container = Container()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        Container.loggingFunction = nil
        AppDelegate.container.registerDependencies()

        appCoordinator = AppDelegate.container.resolve(AppCoordinator.self)
        appCoordinator?.start()
        return true
    }

}

