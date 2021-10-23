//
//  ListCoordinator.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 23/10/21.
//

import Foundation
public class ListCoordinator: SZCoordinator {
    public override init() {
    }
    public override func start() {
        let viewController = ListPostVC(viewModel: ListPostViewModel())
        
        navigationController.isNavigationBarHidden = true
        navigationController.viewControllers = [viewController]
    }
}
