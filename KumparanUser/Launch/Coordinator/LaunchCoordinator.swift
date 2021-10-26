//
//  LaunchCoordinator.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 27/10/21.
//

import UIKit

public class LaunchCoordinator: SZCoordinator {
    private let viewModel: LaunchViewModel
    public init(viewModel: LaunchViewModel) {
        self.viewModel = viewModel
    }

    public override func start() {
        
        let viewController = LaunchVC(viewModel: self.viewModel)
        navigation.viewControllers = [viewController]
    }
}
